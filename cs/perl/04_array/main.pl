use strict;
use warnings;

$|=1; #Turn off output buffering

sub main {

    my @files = (
        '../03_download_file_image/test.html',
        '../03_download_file_image/logo.svg',
        '../03_download_file_image/missing.txt',
    );

    foreach my $file(@files) {
        if (-f $file) {
            print("File found: $file\n");
        } else {
            print("File not found: $file\n");
        }

    };
}

main();