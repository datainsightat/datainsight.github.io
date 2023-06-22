use strict;
use warnings;

$|=1;

sub main {
    # * zero or more of the preceeding character, as many as possible (greedy)
    # + one or more of the preceeding character
    # *? zero or more of the preceeding character, as few as possible (non-greedy)
    # +? one or more of the preceeding character, as few as possible (non-greedy)
    # {5} five of the preceeding
    # {3,6} at least 3, at most 6
    # {3,} at least 3

    my $text = 'DE45876:3245345';

    if ($text =~ /(DE\d{2,8})/) {
        print("Matched: '$1'");
    }

}

main();