package Speak;

use Exporter qw(import);

@EXPORT_OK = qw(test greet); #declare array of subroutine names

sub test {
    print "Hello world!\n";
}

sub greet {
    print "Hello user\n";
}

1; #return value 1