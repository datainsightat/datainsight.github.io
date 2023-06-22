use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
    my $input = 'test_error.csv';

    unless(open(INPUT, $input)) {
        die "\nCannot open $input\n";
    }

    <INPUT>;

    my @data;

    LINE: while(my $line = <INPUT>) {

        $line =~ s/^\s*|\s*$//g; # replace leading and trailing white spaces from a string with ''
        $line =~ s/\?|\$|approx\.//g; # replace expressions from a string with ''.

        $line =~ /\S+/ or next LINE;
        
        chomp $line;

        my @values = split /\s*,\s*/, $line;

        if(scalar(@values) < 3) {
            print "Line too short: $line\n";
            next LINE;
        }

        foreach my $value(@values) {
            if($value eq '') {
                print "Empty value: $line\n";
                next LINE;
            }
        }

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