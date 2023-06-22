use strict;
use warnings;

# cpan
# install Data::Dumper;
use Data::Dumper;

$|=1;

sub main {

    my $input = '../13_csv_split/test.csv';

    unless(open(INPUT, $input)) {
        die "\nCannot open $input\n";
    }

    <INPUT>;

    while(my $line = <INPUT>) {

        chomp $line; # Remove non-printing characters at the beginning or the end of the line

        # my @values = split ',', $line;
        my @values = split /\s*,\s*/, $line; # Match 0 or more spaces, followed by a comma and 0 or more spaces

        # print join '|', @values;

        print Dumper(@values);

    }

    # while (<INPUT>) { # perl is implicity using the default variable $_ for the read line.

    #     chomp;

    #     print $_ . "\n";

    # }

    close INPUT;

}

main()