use strict;
use warnings;

$|=1;

sub main {

    my %months = (
        "Jan" => 1,
        "Dec" => 12,
        "Mar" => 3,
        "Jun" => 6,
    );

    print $months{"Dec"} . "\n";
    print "---\n";

    my %days = (
        1 => "Monday",
        2 => "Tuesday",
        3 => "Wednesday",
        4 => "Thursday",
    );

    print $days{1} . "\n";
    print "---\n";

    my @months = keys %months;

    foreach my $month(@months) {
        my $value = $months{$month};

        print "$month: $value\n";
    }

    print "---\n";

    while(my ($key,$value) = each %days) {
        print "$key: $value\n";
    }

}

main();