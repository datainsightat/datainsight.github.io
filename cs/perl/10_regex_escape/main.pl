use strict;
use warnings;

$|=1;

sub main {
    # \d digit
    # \s space
    # \S non-space
    # \w alphanumeric

    my $text1 = 'I am 117 years old tomorrow';

    if ($text1 =~ /(\d+)/) {
        print("Matched 1: '$1'\n");
    }

    if ($text1 =~ /(am\s*\d+)/) {
        print("Matched 2: '$1'\n");
    }

    if ($text1 =~ /(y\S*)/) {
        print("Matched 3: '$1'\n");
    }

    my $text2 = 'Iam_117-years_old-tomorrow';

    if ($text2 =~ /(\w*)/) {
        print("Matched 4: '$1'\n");
    }
}

main();