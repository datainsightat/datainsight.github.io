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
    getopts('d:r', \%opts);

    if(!checkusage(\%opts)) {
        usage();
        exit();
    }

    my $input_dir = $opts{"d"};
    my @files = get_files($input_dir);
    my @data = process_files(\@files, $input_dir);

    create_tables();
    add_to_database(\@data);

    # print Dumper(@data);
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

    unless($sth_bands) {
        die "add_to_database: error preparing SQL bands\n";
    }

    unless($sth_albums) {
        die "add_to_database: error preparing SQL albums\n";
    }

    my $sth_band_id = $connection->prepare('select max(band_id) from lif_test1');
    my $band_id_rc = $sth_band_id->execute();
    my $band_id = $sth_band_id->fetchrow();

    # print "$band_id_rc\n";

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

            unless($sth_albums->execute($album_name,$album_position,1)) {
                die "add_to_database: error executing SQL albums\n"
            }

        }

    }

    $sth_bands->finish();
    $sth_albums->finish();
    $sth_band_id->finish();

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
	
	my $r = $opts->{"r"};
	my $d = $opts->{"d"};
	
	# Image a is optional; don't really need to refer to it here at all.
	
	# r is optional
	# d is mandatory.
	
	unless(defined($d)) {
		return 0;
	}
	
	return 1;
}

sub usage {
	print <<USAGE;
	
usage: perl main.pl <options>
	-d <directory>	specify directory in which to find XML files.
	-r run the program; process the files

example usage:
	# Process files in currect directory.
	perl main.pl -d . -r
	
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