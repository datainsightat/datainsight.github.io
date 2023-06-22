use strict;
use warnings;
use utf8;

use LWP::Simple;

$|=1;

sub main {

    my $content = get("https://www.orf.at");

    unless(defined($content)) {
        die "Unreachable url\n";
    }

    #print $content;

    while($content =~ m|<h3 class="ticker-story-headline">.*?<a href=".*?">.*?\b(.*?)\s*<\/a>.*?<\/h3>|sig) { # 'sig' 's' dot matches newline, 'i' case insensitive, 'g' repeat
        my $title = $1; # Set variable title to first group

        chomp $title;

        print "Title: $title\n";
    }

}

main();