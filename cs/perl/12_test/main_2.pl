use strict;
use warnings;

$|=1;

sub main {

    my @addresses = (
        'test1@email.com',
        'test2@email.com',
        'test3email.com',
        'test4@emailcom',
    );

    foreach my $address(@addresses) {
        if ($address =~ /(\w+\@\w+\.\w+)/) {
            print("valid: $address\n");
        } else {
            print("invalid: $address\n");
        }
    };

}

main();