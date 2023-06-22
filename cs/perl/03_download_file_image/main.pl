use strict;
use warnings;

use LWP::Simple;

sub main {
    print("Download ...\n");
    #print(get("http://www.orf.at")); #LWP::Simple::
    LWP::Simple::getstore("http://www.orf.at","test.html"); #LWP::Simple::
    
    my $code = LWP::Simple::getstore('https://orf.at/mojo/1_4_1/storyserver//news/common/images/orf-brick.svg','logo.svg');
    
    if($code == 200) {
        print("Success\n");
    } else {
        print("Failed\n");
    }

    print("Finished\n");
}

main();