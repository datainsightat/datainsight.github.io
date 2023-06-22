use strict;
use warnings;

$|=1;

sub main {

    my $file = '../05_read_file/moby_dick.txt';

    open(INPUT, $file) or die("Input file $file not found.\n");

    while(my $line = <INPUT>) {
        #if ($line =~ /(s.*n)/) { # Greedy wildcard. It tries to match as many characters as possible.
        if ($line =~ /(s.*?n)/) { # Non-Greed wildcard. It tries to match as little characters as possible.
            print("$1\n");
        }
    }
}

main();