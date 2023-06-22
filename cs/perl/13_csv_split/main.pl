use strict;
use warnings;

$|=1;

sub main {

    my $input = 'test.csv';

    unless(open(INPUT,$input)) {
        die "\nCannot open $input\n";
    }

    # while(<INPUT>) {
    #     print($_); # Print current line from <INPUT> of while loop
    # }

    <INPUT>; # Read header line

    while(my $line = <INPUT>) {

        my @values = split(',',$line);

        print($values[0]."\n"); # Print current line from <INPUT> of while loop
    }

    close(INPUT);

}

main();