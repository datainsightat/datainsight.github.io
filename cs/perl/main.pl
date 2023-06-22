use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

$|=1;

=pod
    This is ACME XML parser version 1.0
    use with care.
=cut

sub main {

    my %opts;
    my $opts_ref = \%opts;

    # Get command line options
    getopts('af:r', \%opts);

    #print "hash: " . %opts{'f'} . "\n";
    #print "reference: " . $opts_ref->{'f'} . "\n";

    #if(!checkusage("Hello",1,4)) {
    if(!checkusage($opts_ref)) {
        usage();
    }
}

sub checkusage {

    # @_ is an array that contains all variables

    #my ($greeting,$number) = @_;
    #my $greeting = shift; # @_;
    #my $number = shift; # @_;

    #print "$greeting $number\n";

    my $opts_ref = shift;

    my $a = $opts_ref->{"a"};
    my $f = $opts_ref->{"f"}; # Mandatory
    my $r = $opts_ref->{"r"}; # Mandatory

    unless(defined($r) and defined($f)) {
        return 0;
    }

    unless($f =~ /\.xml$/i) {
        print "File must have .xml extension\n";
        return 0;
    }

    return 1; # 0: false, 1: true
}

sub usage {

    # Multi line text
    my $help = <<USAGE;

usage: perl main.pl <options>
    -f: <file name>: specify file name to parse
    -r: run program
    -a: turn off error checking

example usage:
    perl main.pl -f test.xml -a -r

USAGE

    die $help;
}

main();