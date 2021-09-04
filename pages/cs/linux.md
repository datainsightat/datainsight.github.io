# Fundamentals

## Directory Structure

    /	Root
    /bin	Binaries
    /etc	System configuration files
    /home	Home directories
    /opt	Optional or third party software
    /opt/xxx/bin	
    /opt/xxx/etc	
    /tmp	Temporary space
    /usr	User related programs
    /usr/local/xxx/bin	
    /usr/local/xxx/etc	
    /var	variable data, log files
    /cdrom	Mount point for CD-Rom
    /media	Mount point
    /srv	Data served by the systm

## Basic Linux Commands

    ls	List directory
    cd	Change directory
    pwd	Present working directrory
    cat	Display content of a file
    echo	Display arguments
    man	Online manual
    exit	Exit the shell
    clear	Clear screen

## Working with Directories

    mkdir [-p] directory	Create directory. -p: parents
    rmdir [-p] directory	Remove directory
    rm -rf directory	Recursively delete directory

## ls Options

    -l	List View
    -F	File type
    -t	List by time
    -r	Reverse order
    -a	All files
    --color	Colorize output
    -d	Directory names
    -R	Recursively

## File and Directory Permissions

    $ ls -l

    Type, User, Group, Other
    -rw-rw-r--

    - … regular file
    d … directory
    l … symbolic link

    $ group

    chmod	Change mode command
    ugoa	User category
        
    u … user
    g … group
    o … other
    a … all

    +-=	Add, subtract or set permissions
    rwx	Read, Write, Execute
        
    r … read
    w … write
    x … execute

    r	w	x	
    0	0	0	Value for off
    1	1	1	Binary value for on
    4	2	1	Base 10 value for on


    $ chmod g+w sales.data
    $ chmod u+rwx, g-x sales.data
    $ chmod a=r sales.data

    $ chmod 777 sales.data

    chgrp	Change group of file

    $ chgrp sales sales.data

    umask	Turn off, subtract permissions

    $ umask 077 sales.data

    chmod 777 - umask 002 =  chmod 775

## Findig Files and Directories

    find [path] [expression]
    -name pattern	match pattern
    -iname pattern	ignores pattern
    -type	'd' directory
    -ls	ls on each found item
    -mtime days	modification date
    -size num	
    -newer file	files newer than …
    -exec command {} \;	

    $ find
    $ find . 

    locate

    searches index > not real time

    $ locate sales.txt

## Viewing Files

    cat file	Display contents
    more file	Browser through text file
    less file	More features than more
    head file	Output at the beginning
    tail file	Output at the ending
        -f … follow the file
        -5 … just 5 lines

    $ tail -f file

## vi

    Esc	Command mode
    iLaA	Insert
    :	Line

    k	up one line
    j	down one line
    h	left one character
    l	right
    w	right one word
    b	left one word
    ^	begin line
    $	end line

    i	insert at the cursor position
    I	insert at beginning of the line 
    a	append after cursor
    A	append at the end of the line

    :w	write file
    :w!	Force write file
    :q	quit
    :q!	force quit
    :n	Position cursor
    :$	Last line
    :set nu	Turn on line numbering
    :set nonu	Turn off line numbering
    :help	get help

    5k	Move up 5 times
    x	Delete a character
    dw	Delete a word
    dd	Delete a line
    D	Delete from current position
    r	Replace currentcharacter
    CW	Change current word
    cc	Change current line
    c$	Change text from current position
    C	as c$
    ~	Reverse case of a character

    yy	Copy current line
    y<pos>	Yank the position
    p	paste
    u	undo
    Ctrl-R	redo
    /<pattern>	Forward search
    ?<pattern>	Reverse search

## Delete, Copy, Move and Rename File

    rm file	Remove file
    rm -r dir	Remove directory and files
    cp <source> <destination>	Copy
        -i … interactive mode

    $ mkdir dir
    $ cp file1 file2 dir
    $ mkdir dir2
    $ mkdir dir3
    $ cp dir dir2 dir3

    mv source destination	move
        -i … interactive

    $ mv dir firstdir
    $ mv file1 file1-renamed

    sort	sorts file contents
        -k F … sort by key (F = field number)
        -r … reverse order
        -u … unique

    $ cat more-secrets
    $ sort -u -k2 more-secrets

## tar	collection of files

	-c … create
	-x … extract
	-t … contents
	-v … verbose
	-z … compress
	-f … use this file

    $ tar cf tps.tar tpsreport
    $ tar tf tps.tar
    $ tar xf /home/jason/tps.tar

    gzip	compress
    gunzip	uncompress

    du	Disk usage
        -k … kilobytes

    Merge files

    $ rsync -a /source /target
