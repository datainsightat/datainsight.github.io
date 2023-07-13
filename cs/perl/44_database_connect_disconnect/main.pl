use strict;
use warnings;
use Data::Dumper;
use Getopt::Std;

use DBI;
# cpan install DBD::Oracle

$|=1;

=pod
    Establish a connection to Oracle
=cut

sub main {
    my $connection = db_connect();
    db_disconnect($connection);
}

sub write_data {
    
}

sub db_connect {

    # Read Database Credentials
    # $ export DB_CREDENTIAL=XXX
    my $db_user = $ENV{"DB_USER"};
    my $db_pw = $ENV{"DB_PW"};
    my $db_name = $ENV{"DB_NAME"};

    print "try connect to db ...\n";
    #"oracle+cx_oracle://db_user:db_pw@db_name"
    my $dbh = DBI->connect("dbi:Oracle:$db_name",$db_user,$db_pw) or die "cannot connect to DB => " . DBI->errstr . "\n";

    return $dbh;
}

sub db_disconnect {

    my $dbh = shift; 

    $dbh -> disconnect();

    print "disconnect from db ...\n";

    return 1;

}

main();