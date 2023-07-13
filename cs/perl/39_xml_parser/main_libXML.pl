use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

#use XML::Simple;
use XML::LibXML;
use feature 'say';

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

    #my $filename = 'playlist.xml';

    #my $dom = XML::LibXML->load_xml(location => $filename);
    #my $dom = XML::LibXML->load_xml(location => $filepath);

    #$/ = "</album>"; # Global variable for record separation
    undef $/;

    my $content = <INPUTFILE>;

    close INPUTFILE;

    #my $parser = new XML::Simple;

    #my $dom = $parser->XMLin($content); #, KeyAttr => [], ForceArray => qr/artist/); #, KeyAttr => { artist => 'name' }, ForceArray => ['album','song']);
    my $dom = XML::LibXML->load_xml(location => $filepath);
    
    print $dom->findnodes('/xml/music/artist');

    # foreach my $title ($dom->findnodes('/xml')) {
    #     say $title->to_literal();
    # }
    
    #print $dom->{"music"}; #->{"artist"};

    # foreach my $music (@{$dom->{"music"}->{"artist"}}) {
    #     print Dumper($music->{"name"});
    # }

    #print Dumper($dom->{"music"}->{"artist"});

    # foreach my $key(keys $dom) { #->{"music"}
    #     print "$key\n";
    # }

}

sub get_files {
    my $input_dir = shift;

    #print "Input dir: $input_dir\n";

    unless(opendir(INPUTDIR, $input_dir)) {
        die "Unable to open directory '$input_dir'\n";
    };

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
    perl main.pl -d perl main.pl -d ../36_find_and_process_xml_files/ -r

USAGE

    #die $help;
}

main();