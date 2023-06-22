use strict;
use warnings;

use LWP::Simple;

$|=1;

sub main {

    my $content = get("https://www.orf.at");

    unless(defined($content)) {
        die "Unreachable url\n";
    }

    #print $content;

    if($content =~ m'<h3 class="ticker-story-headline">.*?<a href=".*?">.*?\b(.*?)\s*<\/a>.*?<\/h3>'si) { # 'si' dot matches newline, case insensitive
        my $title = $1; # Set variable title to first group

        chomp $title;

        print "Title: $title\n";
    } else {
        print "Title not found\n";
    }

}

main();