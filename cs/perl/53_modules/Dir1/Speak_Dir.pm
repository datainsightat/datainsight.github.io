package Dir1::Speak_Dir;

use Exporter qw(import);

@EXPORT_OK = qw(test_dir greet_dir); #declare array of subroutine names

sub test_dir {
    print "Hello world dir!\n";
}

sub greet_dir {
    print "Hello user dir\n";
}

1; #return value 1