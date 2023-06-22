use strict;
use warnings;

$|=1;

sub main {
    my $file = 'moby_dick.txt';

    open(INPUT, $file) or die("Input file: $file not found.\n");

    while(my $line = <INPUT>) {
        if($line =~ / meat /) {
            print $line;
        }
    }

    # while(<INPUT>) {
    #     print $_;
    # }

    close(INPUT);
}

main();