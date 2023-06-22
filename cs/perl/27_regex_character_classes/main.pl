use strict;
use warnings;

$|=1;

sub main {

    my $content = "The 39 Steps - a GREAT book - Colours_15 ==%== AACCBBBCCAABBCBCABBB";

    # [0-9] any number
    # [A-Z] any uppercase letter
    # [A-Za-z_0-9] alternatives
    # [\=\%] Backslash special characters
    # [^0-9T\s] Match anything except '^' these characters

    #if($content =~ /([A-Z]{2,})/) { # GREAT
    #if($content =~ /(C[A-Za-z_0-9]{2,})/) { # Colours_15
    #if($content =~ /([\=\%]{2,})/) { # ==%==
    #if($content =~ /([ABC]{3,})/) { # AACCBBBCCAABBCBCABBB
    if($content =~ /([^0-9T\s]{5,})/) { # Steps
        print "Matched '$1'\n";
    } else {
        print "No match\n";
    }

}

main();