## regex

[regex101](https://regex101.com/)

## Perl

### Match Operator
The match operator 'm' matches everything between the delimiters. In this case '/'. However any other dilimiter symbol can be chosen.
```perl
my $line =~ m//
```

### Modifiers
The modifiers 's,i,g, ...' refine the matching expression
```perl
my $line =~ m//sig
```

|Modifier|Description|
|-|-|
|i|Case insensitive|
|m|Mulitline. Specifies that if the string has newline or carriage return characters, the ^ and $ operators will now match against a newline boundary, instead of a string boundary.|
|o|Evaluate expression only once|
|s|Allows use of . to match a newline character|
|x|Allows you to use white space in the expression for clarity.|
|g|Globally finds all matches.|
|c|Allows the search to continue even after a global match fails.|

### Multiple Matches

```perl
while($content =~ m|<h3 class="ticker-story-headline">.*?<a href=".*?">.*?\b(.*?)\s*<\/a>.*?<\/h3>|sig) { # 'sig' 's' dot matches newline, 'i' case insensitive, 'g' repeat
    my $title = $1; # Set variable title to first group

    chomp $title;

    print "Title: $title\n";
}
```

### Groups
```perl
if($line =~ /(I..a.)(...)/) { # '.' matches any single character. Expressions enclosed by brackets group the match.
    print("first match: '$1', second match: '$2'\n"); # '$1' matches the first regex group, '$2' matches the second.
}
```

### Quantifiers

```perl
while(my $line = <INPUT>) {
    #if ($line =~ /(s.*n)/) { # Greedy wildcard. It tries to match as many characters as possible.
    if ($line =~ /(s.*?n)/) { # Non-Greed wildcard. It tries to match as little characters as possible.
        print("$1\n");
    }
}
```

### Escape Character

Use '\\' to escape special characters
```perl
# \d digit
# \s space
# \S non-space
# \w alphanumeric
    
if ($text1 =~ /(\d+)/) {
    print("Matched 1: '$1'\n");
}
```

### Numeric

```perl
# * zero or more of the preceeding character, as many as possible (greedy)
# + one or more of the preceeding character
# *? zero or more of the preceeding character, as few as possible (non-greedy)
# +? one or more of the preceeding character, as few as possible (non-greedy)
# {5} five of the preceeding
# {3,6} at least 3, at most 6
# {3,} at least 3
    
my $text = 'DE45876:3245345';

if ($text =~ /(DE\d{2,8})/) {
    print("Matched: '$1'");
}
```

### Character Classes

```perl
my $content = "The 39 Steps - a GREAT book - Colours_15 ==%== AACCBBBCCAABBCBCABBB";

# [0-9] any number
# [A-Z] any uppercase letter
# [A-Za-z_0-9] alternatives
# [\=\%] Backslash special characters
# [^0-9T\s] Match anything except '^' these characters

#if($content =~ /([A-Z]{2,})/) { # GREAT
#if($content =~ /(C[A-Za-z_0-9]{2,})/) { # Colours_15
#if($content =~ /([\=\%]{2,})/) { # ==%==
#if($content =~ /([ABC]{3,})/) { # AACCBBBCCAABBCBCABBB
if($content =~ /([^0-9T\s]{5,})/) { # Steps
    print "Matched '$1'\n";
} else {
    print "No match\n";
}
```

```perl
```
