use strict;
use warnings;

$|=1;

sub main {

    my $text = 'The code for this device is GP8765.';

    #if ($text =~ /(\w{2}\d{4})/) {
    if ($text =~ /\sis\s(.+?)\./) {
        print("Machine code: '$1'\n");
    }
}

main()