use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {

    my $input = '../13_csv_split/test.csv';

    unless(open(INPUT, $input)) {
        die "\ncannot open input\n";
    }

    <INPUT>;

    my @lines; # define array

    while(my $line = <INPUT>) {
        
        chomp $line;

        push @lines, $line;

    }

    close INPUT;

    foreach my $line(@lines) {
        print $line . "\n";
    }
}

main();