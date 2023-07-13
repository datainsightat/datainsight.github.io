## Perl

[CPAN](https://www.cpan.org/)  
[Code Examples](https://github.com/datainsightat/DataScience_Examples/tree/main/cs/perl)

### Structures

#### Boilerplate
```perl
use strict; # restrict unsafe constructs
use warnings; # control optional warnings

$|=1; # output any data immediately, without buffering

sub main {
}

main();
```

#### Read File
```perl
my $file = 'moby_dick.txt';

open(INPUT, $file) or die("INPUT file: $file not found.\n");

# Explicity set variable to line
while(my $line = <INPUT>) {
  print $line;  
}

# Implicitly assign line to variable '$_'. The print command automatically prints '$_' without any further inputs.
while(<INPUT>) {
    print;
}

close(INPUT);
```

#### Write File
```perl
my $input = 'moby_dick.txt';
open(INPUT, $file) or die("INPUT file: $file not found.\n");

my $ouput = 'output.txt';
open(OUTPUT, '>'.$output) or die("Can't create $output.\n");

while(my $line = <INPUT>) {
  print(OUTPUT $line);
}

close(INPUT);
close(OUTPUT);
```

### Datastructures

#### Scalar
```perl
my $variable = 'hello';
```

#### Array
```perl
my @files = (
  '../03_download_file_image/test.html',
  '../03_download_file_image/logo.svg',
  '../03_download_file_image/missing.txt', 
)
```

##### Split String into Array
```perl
my $line = 'first,second,third';
chomp $line; # REmove non-printing charcters at the beginning and the end of the line
my @values = split(',',$line);
```

##### Add value to array
```perl
my @lines; #define array
my $line = 'This is a test';
push @lines, $line;

for my $line(@lines) {
  print $line . "\n";
}
```

##### Add reference on array to array
```perl
my @lines; #define array
my $line = 'first,second,third';
my @values = split /\s*,\s*/, $line;

push @lines, \@values;

for my $line(@lines) {
  print $line->[0] . "\n";
}
```

#### Hash
```perl
my %days = (
  1 => "Monday",
  2 => "Tuesday",
  3 => "Wednesday",
  4 => "Thursday",
)

print $days{1} . "\n";

my @day_keys = keys %days;

while(my ($key,$value) = each %days) {
    print "$key: $value\n";
}

foreach my $key(sort keys %days) {
    my $value = $days{$key};

    print "$key: $value\n";
}
```

##### Add reference on hash to array
```perl
my %hash = (
    "cat" => "meat",
    "birds" => "seeds",
    "fish" => "worms",
);

my @test;

push @test, \%hash;

$test[1] = \%hash;

print $test[0]{"birds"} . "\n";
print $test[1]{"fish"} . "\n";
```

### Arguments
```bash
$ perl main.pl -a -f some_argument -c
```
```perl
use strict;
use warnings;
use Data::Dumper;
use Getopt::Std; # Get Arguments

$|=1;

sub main {
    my %opts;

    getopts('af:c',\%opts); # Add ':' to flags that can take arguments

    print Dumper(%opts);

    my $file = $opts{'f'};

    print "File: $file\n";
}

main();
```

### Subroutines
```perl
sub main {
  my @arguments = ('one','two','three');
  subroutine1(@arguments);
  subroutine2(@arguments);
}

sub subroutine1 {
  my $opt1 = shift;
  my $opt2 = shift;
  my $opt3 = shift;
}

sub subroutine2 {
  my ($opt1,$opt2,$opt3) = @_;
}

main();
```

### Perl One Liners

#### Execute Perl Program
'-e' executes the perl code

```perl
$ perl -e 'print "Hello World!\n;"'
```

#### Get Data from URL

```perl
$ perl -e 'use LWP::Simple; print get("http://www.orf.at");'
```

#### Replace Text in File

'-p' iterates over textfile. The line is stored in the '@_' variable.

```perl
$ perl -pe 's/\bme\b/ZORG/gi' moby_dick.txt
```

'-i' creates a new file with the substitution. It stores the original file in a new file version.

```perl
$ perl -i.orig -pe 's/\bme\b/ZORG/gi' moby_dick.txt
```

### Modules
```
/main.pl
/Speak.pm
/Dir1/Speak_Dir.pm
```

#### main.pl
```perl
use strict;
use warnings;
use Data::Dumper;

# @INC contains all paths, perl is searching for modules

#use File::Basename;
#use lib dirname (__FILE__);
use lib '.'; # Add current folder to @INC
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
```

#### Seak.pm
```perl
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
```

#### Seak_Dir.pm
```perl
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
```

### Classes
```
/main.pl
/Data/Person.pm
```

#### main.pl
```perl
use strict;
use warnings;

use lib '.';
use Data::Person;

$|=1;

sub main {

    my $person1 = new Data::Person("Bob",45);
    $person1->greet("Mike");

    my $person2 = new Data::Person("Sue",30);
    $person2->greet("Bob");

}

main();
```

#### Person.pm
```perl
package Data::Person;

sub new {
    my $class = shift;

    # Create hash
    # my %self = (
    #     "name" => shift,
    #     "age" => shift,
    # );
    
    # Crete reference to hash
    my $self = {
        "name" => shift,
        "age" => shift,
    };

    bless($self,$class);

    return $self;
}

sub greet {
    my ($self,$other) = @_;

    print "Hello, $other, I am " . $self->{"name"} . ". My age is " . $self->{"age"} . ".\n";
}

1;
```

### Shell Commands
```perl
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
```

### Packages

#### Download Web > LWP::Simple

```perl
use LWP::Simple;

LWP::Simple::getstore("http://www.orf.at","test.html");
```
