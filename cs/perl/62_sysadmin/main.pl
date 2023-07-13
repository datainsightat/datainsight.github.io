use strict;
use warnings;

use File::Copy;

$|=1;

sub main {
    copy('./moby_dick.txt','./Dir1/');
    move('./moby_dick.txt','./Dir2/');
    move('./Dir2/moby_dick.txt','./');

    # Execute system command with backticks '`'.
    print `ls -l`;
    `cp ./moby_dick.txt ./Dir3/`
}

main();