use strict;
use warnings;

use lib '.';
use Data::Person;

$|=1;

sub main {

    my $person1 = new Data::Person("Bob",45);
    $person1->greet("Mike");

    my $person2 = new Data::Person("Sue",30);
    $person2->greet("Bob");

}

main();