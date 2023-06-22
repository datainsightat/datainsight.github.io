use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
    my $input = '../13_csv_split/test.csv';

    unless(open(INPUT, $input)) {
        die "\nCannot open $input\n";
    }

    <INPUT>;

    my @data;

    while(my $line = <INPUT>) {
        chomp $line;

        my ($name, $payment, $date) = split /\s*,\s*/, $line;

        my %values = (
            "Name" => $name,
            "Payment" => $payment,
            "Date" => $date,
        );

        push @data, \%values;
    }

    close INPUT;

    print Dumper(@data);
    print "---\n";

    foreach my $data(@data) {
        print $data->{"Name"} . "\n";
    }

    print "---\n";

    print "Name: " . $data[3]{"Name"} . "\n";
}

main();