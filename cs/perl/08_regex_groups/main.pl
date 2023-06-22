use strict;
use warnings;

$|=1;

sub main {
    
    my $file = '../05_read_file/moby_dick.txt';
    
    open(INPUT, $file) or die("input file $$file not found.\n");

    while (my $line = <INPUT>) {
        if($line =~ /(I..a.)(...)/) { # '.' matches any single character. Expressions enclosed by brackets group the match.
            print("first match: '$1', second match: '$2'\n"); # '$1' matches the first regex group, '$2' matches the second.
        }
    }

    close(INPUT);

}

main();