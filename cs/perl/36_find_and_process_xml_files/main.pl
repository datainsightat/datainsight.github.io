use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

$|=1;

=pod
    Find files in a directory
=cut

sub main {

    # set datastructure for command line options
    my %opts; # options hash
    my $opts = \%opts; # reference to options hash

    # get command line options
    getopts('d:r',$opts);

    # check options
    if(!checkusage($opts)) {
        usage();
        exit();
    }

    my $input_dir = $opts{"d"};

    my @files = get_files($input_dir);

    process_files(\@files, $input_dir);
}

sub process_files {
    my ($files, $input_dir) = @_;

    #print $input_dir . "\n";
    #print Dumper($files);

    foreach my $file(@$files) { # Cast reference to array into actual array using the '@' sign
        process_file($file,$input_dir);
    }
}

sub process_file {
    my ($file, $input_dir) = @_;

    print "Processing $file in $input_dir\n";

    my $filepath = "$input_dir/$file";
    open(INPUTFILE, $filepath) or die "Unable to open $filepath";

    $/ = "</album>"; # Global variable for record separation

    my $count = 0;

    while(my $chunk = <INPUTFILE>) {
        #print "\n$count: $chunk\n";

        my ($album) = $chunk =~ m'<album title=\"(.*?)\"';

        unless(defined($album)) {
            next;
        }

        my @songs = $chunk =~ m'<song title=\"(.*?)\"'ig; # Match all songs in the chunk 'g'.

                print "\nAlbum: $album\nTotal songs:" . scalar(@songs). "\n";

        foreach my $song(@songs) {
            print "  $song\n";
        }

        $count++;
    }

    close INPUTFILE
}

sub get_files {
    my $input_dir = shift;

    #print "Input dir: $input_dir\n";

    unless(opendir(INPUTDIR, $input_dir)) {
        die "Unable to open directory '$input_dir'\n";
    }

    my @files = readdir(INPUTDIR); # read files in directory into array

    closedir(INPUTDIR);

    @files = grep(/\.xml$/i,@files); # filter xml files

    return @files;
}

sub checkusage {
    my $opts = shift; # get options from command line

    my $d = $opts->{"d"}; # Mandatory
    my $r = $opts->{"r"};

    unless(defined($d)) {
        print "Please set mandatory option '-d'\n";
        return 0;
    }

    return 1; # Check is OK
}

sub usage {
    # Multi line text
    my $help = <<USAGE;

usage: perl main.pl <options>
    -d: <directory name>: directory to seach xml files in
    -r: run program

example usage:
    # process files in the local directory
    perl main.pl -d . -r

USAGE

    #die $help;
}

main();