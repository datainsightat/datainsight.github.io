## Perl One Liners

### Execute Perl Program
'-e' executes the perl code

```perl
$ perl -e 'print "Hello World!\n;"'
```

### Get Data from URL

```perl
$ perl -e 'use LWP::Simple; print get("http://www.orf.at");'
```

### Replace Text in File

'-p' iterates over textfile. The line is stored in the '@_' variable.

```perl
$ perl -pe 's/\bme\b/ZORG/gi' moby_dick.txt
```

'-i' creates a new file with the substitution. It stores the original file in a new file version.

```perl
$ perl -i.orig -pe 's/\bme\b/ZORG/gi' moby_dick.txt
```
