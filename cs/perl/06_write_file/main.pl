use strict;
use warnings;

$|=1;

sub main {

    my $input = '../05_read_file/moby_dick.txt';
    open(INPUT, $input) or die("Input file $input not found.\n");

    my $output = 'output.txt';
    open(OUTPUT, '>'.$output) or die("Can't create $output.\n");

    while(my $line = <INPUT>) {

        if($line =~ /\bmeat\b/) {

            $line =~ s/\band\b/AND/ig; # Replace (s) 'and' with 'AND', case sensitive (i), any ocurrances (g).

            print(OUTPUT $line);
        }
    }

    close(INPUT);
    close(OUTPUT);
};

main();