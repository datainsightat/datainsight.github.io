use strict;
use warnings;

use Data::Dumper;

$|=1;

sub main {
    my $input = 'test.csv';

    unless(open(INPUT,$input)) {
        die "\nCannot open $input\n";
    }

    my $headings = <INPUT>;
    my @headings = split /\s*,\s*/, $headings; # read first line and split it into array

    chomp @headings;

    my @data;

    LINE: while(my $line = <INPUT>) {

        chomp $line; # remove non printing characters

        $line =~ /\S/ or next LINE; # remove blank lines

        $line =~ s/\?|\$|approx\.//g; # substitute ?,$,approx. with ''
        $line =~ s/\s*,\s*/,/g; # substitute spaces around ',' with ','
        $line =~ s/^\s*|\s*$//g; # substitute leading and trailing spaces with ''

        my @values = split /\s*,\s*/, $line;
        
        if (scalar(@values)<3) { # if lenght of array is smaller thatn 3, skip line
            print "*** line too short; $line\n";
            next LINE;
        }

        foreach my $value(@values) { # check, if any column has empty values
            if ($value eq '') {
                print "*** empty value in: $line\n";
                next LINE;
            }
        }
        
        #my ($v1,$v2,$v3) = split /\s*,\s*/, $line;

        my %data; # define data hash table

        for (my $i=0;$i<@headings;$i++) { # iterate over headings array
            my $heading = $headings[$i];
            my $value = $values[$i];

            $data{$heading} = $value;
        }

        push @data, \%data;

    }

    close INPUT;

    print Dumper(@data);

    my $sum = 0;

    foreach my $data(@data) {
        $sum += $data->{"Payment"};
    }

    print "\ntotal sum: $sum\n";
}

main();