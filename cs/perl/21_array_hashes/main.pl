use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {

    my %hash1 = (
        "cat" => "meat",
        "birds" => "seeds",
        "fish" => "worms",
    );

    my @test;

    push @test, \%hash1;

    $test[1] = \%hash1;

    print $test[0]{"birds"} . "\n";
    print $test[1]{"fish"} . "\n";

}

main(); 