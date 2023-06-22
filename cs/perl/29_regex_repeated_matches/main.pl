use strict;
use warnings;

use LWP::Simple;

$|=1;

sub main {
    
    my $content = get("https://www.orf.at");

    unless(defined($content)) {
        die "Unreachable url\n";
    }

    my @classes = $content =~ m|class="([^"']*?)"|sig;

    if(@classes == 0) { # Check the number of items in the array
        print "No matches\n";
    } else {
        foreach my $class(@classes) {
            print "$class\n";
        }
    }
}

main();