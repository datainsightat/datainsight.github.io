use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;
use XML::Simple;

use DBI;
# cpan install DBD::Oracle

$|=1;

=pod

    Establish a connection to Oracle

    You need to set these environment variables

    DB_USER, DB_PW, DB_NAME

=cut

sub main {

    # get command line options
    my %opts;
    getopts('i:e', \%opts);

    if(!checkusage(\%opts)) {
        usage();
        exit();
    }

    if ($opts{"i"}) {

        my $input_dir = $opts{"i"};
        my @files = get_files($input_dir);
        my @data = process_files(\@files, $input_dir);

        create_tables();
        add_to_database(\@data);

    }

    if ($opts{"e"}) {

        export_from_database();

    }

    # print Dumper(@data);
}

sub export_from_database {
    my $dbh = shift;

    print "Exporting ...\n";

    my $output_file = "output.csv";
    open OUTPUT, '>'.$output_file or die "Cannot open output file: $output_file.\n";



    my $connection = db_connect();
    my $sql = <<string_ending_delimiter;

        select
            a.band_id,
            a.name band_name,
            b.album_id,
            b.name album_name,
            b.position
        from
            lif_test1 a
        left join
            lif_test2 b on
                a.band_id = b.band_id

string_ending_delimiter

    my $sth = $connection->prepare($sql);

    unless(defined($sth)) {
        die "Unable to prepare export query.\n";
    }

    unless($sth->execute()) {
        die "Unable to execute export query.\n";
    }

    while(my $row = $sth->fetchrow_hashref()) {
        my $band_id = $row->{"BAND_ID"};
        my $band_name = $row->{"BAND_NAME"};
        my $album_id = $row->{"ALBUM_ID"};
        my $album_name = $row->{"ALBUM_NAME"};
        my $position = $row->{"POSITION"};

        print OUTPUT "$band_id\,$band_name\,$album_id\,$album_name\,$position\n";
        
    }

    $sth->finish();

    print "Export completted to $output_file\n";

    close OUTPUT;
}

sub create_tables {

    my $connection = db_connect();

    $connection->do('
        create table 
            lif_test1 (
                band_id integer generated always as identity (start with 1 increment by 1),
                name varchar(50),
                primary key(band_id)
            )
        ') or print "table lif_test1 does already exist\n";

    $connection->do('delete from lif_test1') or die "failed cleaning table lif_test1\n";

    $connection->do('
        create table 
            lif_test2 (
                album_id integer generated always as identity (start with 1 increment by 1),
                name varchar(50),
                position integer,
                band_id integer,
                primary key(album_id)
            )
        ') or print "table lif_test2 does already exist\n";

    $connection->do('delete from lif_test2') or die "failed cleaning table lif_test2\n";
    
    db_disconnect($connection);
}

sub add_to_database {
    my $data = shift;

    my $connection = db_connect();

    my $sth_bands = $connection->prepare('insert into lif_test1 (name) values (?)');
    my $sth_albums = $connection->prepare('insert into lif_test2 (name,position,band_id) values (?,?,?)');
    my $sql = <<string_ending_delimiter;

        select
            max(band_id) band_id
        from
            lif_test1

string_ending_delimiter

    unless($sth_bands) {
        die "add_to_database: error preparing SQL bands\n";
    }

    unless($sth_albums) {
        die "add_to_database: error preparing SQL albums\n";
    }


    foreach my $data(@$data) {
        my $band_name = $data->{"name"};
        my $albums = $data->{"albums"};

        print "insert into db: $band_name\n";

        unless($sth_bands->execute($band_name)) {
            die "add_to_database: error executing SQL bands\n"
        }

        foreach my $album(@$albums) {

            my $album_name = $album->{"name"};
            my $album_position = $album->{"position"};

            my $sth_band_id = $connection->prepare($sql);

            unless(defined($sth_band_id)) {
                die "Unable to prepare export query.\n";
            }

            unless($sth_band_id->execute()) {
                die "Unable to execute export query.\n";
            }

            my $row = $sth_band_id->fetchrow_hashref();
            my $band_id = $row->{"BAND_ID"};

            unless($sth_albums->execute($album_name,$album_position,$band_id)) {
                die "add_to_database: error executing SQL albums\n"
            }

            $sth_band_id->finish();

        }

    }

    $sth_bands->finish();
    $sth_albums->finish();

    db_disconnect($connection);
}

sub process_files{
    my($files,$input_dir) = @_;

    foreach my $file(@$files) {
        my @bands = process_file($file,$input_dir);
        # print Dumper(@bands);
        return @bands;
    }
}

sub process_file{
    my($file,$input_dir) = @_;

    print "Processing $file in $input_dir ...\n";

    my $filepath = "$input_dir/$file";

    open(INPUTFILE,$filepath) or die "Unable to open $filepath\n";

    undef $/;

    my $content = <INPUTFILE>;

    close(INPUTFILE);

    my $parse = new XML::Simple;

    my $dom = $parse->XMLin($content, ForceArray=>1);

    my @output;

    foreach my $band(@{$dom->{"entry"}}) {
        my $band_name = $band->{"band"}->[0];
        my $albums = $band->{"album"};

        my @albums;

        foreach my $album(@$albums) {
            my $album_name = $album->{"name"}->[0];
            my $chartposition = $album->{"chartposition"}->[0];

            push @albums, {
                "name" => $album_name,
                "position" => $chartposition,
            }
        }

        push @output, {
            "name" => $band_name,
            "albums" => \@albums,
        }
    }

    return @output;
}

sub get_files {
    my $input_dir = shift;

    unless(opendir(INPUTDIR, $input_dir)) {
        die "\nUnable to open directory '$input_dir'\n";
    }

    my @files = readdir(INPUTDIR);

    closedir(INPUTDIR);

    @files = grep(/\.xml$/ig,@files);

    return @files;
}

sub checkusage {
	my $opts = shift;
	
	my $e = $opts->{"e"};
	my $i = $opts->{"i"};
	
	# Image a is optional; don't really need to refer to it here at all.
	
	# e is optional
	# i is mandatory.
	
	unless(defined($i) or defined($e)) {
		return 0;
	}
	
	return 1;
}

sub usage {
	print <<USAGE;
	
usage: perl main.pl <options>
	-i <directory>	specify directory in which to find XML files.
	-e export database

example usage:
	# Process files in currect directory.
	perl main.pl -i .

    # Export database table
    perl main.pl -e
	
USAGE
}

sub db_connect {

    # Read Database Credentials
    # $ export DB_CREDENTIAL=XXX
    my $db_user = $ENV{"DB_USER"};
    my $db_pw = $ENV{"DB_PW"};
    my $db_name = $ENV{"DB_NAME"};

    print "connect to db ...\n";
    #"oracle+cx_oracle://db_user:db_pw@db_name"
    my $dbh = DBI->connect("dbi:Oracle:$db_name",$db_user,$db_pw) or die "cannot connect to DB => " . DBI->errstr . "\n";

    return $dbh;
}

sub db_disconnect {

    my $dbh = shift; 

    $dbh -> disconnect();

    print "disconnect from db ...\n";

    return 1;

}

main();