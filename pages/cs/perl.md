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

#### Hash
```perl
my %days = (
  1 => "Monday",
  2 => "Tuesday",
  3 => "Wednesday",
  4 => "Thursday",
)
```

### Packages

#### Download Web > LWP::Simple

```perl
use LWP::Simple;

LWP::Simple::getstore("http://www.orf.at","test.html");
```
