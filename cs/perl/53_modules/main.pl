use strict;
use warnings;
use Data::Dumper;

# @INC contains all paths, perl is searching for modules

#use File::Basename;
#use lib dirname (__FILE__);
use lib '.'; # Add current folder to @INC
#use Speak;
use Speak qw(test greet);
use Dir1::Speak_Dir qw(test_dir greet_dir);

$|=1;

sub main {
    #Speak::test();
    test();
    greet();
    
    test_dir();
    greet_dir();

    #my @dogs = ("retriever","labrador");
    my @dogs = qw(retriever labrador);

    print Dumper(@dogs);
}

main();