use strict;
use warnings;
use Data::Dumper;
use Getopt::Std; # Get Arguments

$|=1;

sub main {
    my %opts;

    getopts('af:c',\%opts); # Add ':' to flags that can take arguments

    print Dumper(%opts);

    my $file = $opts{'f'};

    print "File: $file\n";
}

main();