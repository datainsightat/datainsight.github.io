use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {

    # Hashes are not sorted
    my %foods = (
        "mice" => "cheese",
        "dogs" => "meat",
        "birds" => "seeds",
    );

    # We can define variables like this
    my ($one, $two, $three) = (13,21,38);

    print "the value of \$two is $two\n";

    print "---\n";

    while( my ($key, $value) = each %foods) {
        print "$key: $value\n";
    }

    print "---\n";

    foreach my $key(sort keys %foods) {
        my $value = $foods{$key};

        print "$key: $value\n";
    }

}

main();

