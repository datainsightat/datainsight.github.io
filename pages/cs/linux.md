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

# Intermediate

## Wildcards

	*	zero or more characters
	?	Exactily one character
	[]	Character class
		ca[nt]* > can, cat, candy, catch
	[!]	Exclude characters
	\	escape character
		*\?

## Input/Output Type

	Standard Input 	stdin 	0
	Standard Output 	stdout 	1
	Standard Error 	stderr	2

	>	Redirect file overwrite
	>>	Redirect file append
	<	Redirect file to command

	& File descriptor

	ls -l > files.txt
	ls >> files.txt
	sort < files.txt
	Sort < files.txt > sortet_files.txt
	echo new last line >> file.txt

	ls files.txt not-here 1>out 2>out.err

	files.txt not-here 2>/dev/null

## Comparing Files

	diff file1 file2	Compare 2 files
	sdiff file2 file2	Side-by-side comparison
	vimdiff file2 file2	Highlight differences in vim

## Searching in Files

	grep pattern file	Display lines matching pattern 

	-i	ignore case
	-c	count occurences
	-n	Precede output with new line
	-v	Invert Match

	grep user secret
	grep -v o secret

	file	Display the file type
	strings	Display printable strings

## Pipes

	|	Pipe symbol

	command-output  | command-input

	cat file  | grep pattern

	cut file	Cut out selection of a file 
		-d delimiter
		-f n Display nth field

### Example

	grep bob /etc/passwd | cut -d: -f1,5 | sort | tr ":" " " | column -t

	Piping Output to a Pager
	more	less

	cat /etc/passwd | less

## Copy Files over Network

	scp	Secure copy
	sftp	ssh file transfer protocol
	ftp host	File transfer protocol

	sftp linuxsvr

	lpwd	local pwd
	lls	local ls

	scp z.txt linuxsvr:/tmp/
	scp z.txt adminuser@linuxsvr:/home/adminuser/

## Customize Shell Prompt

	$PS1	Primary Prompt String 
		\d Date
		\h Hostname
		\n Newline
		\t Current time
		\A Current time
		\u User name
		\w Current working directory
		\$ 0,# or $

	echo 'export PS1="[\u@\h \w]\$ "' >> ~/.bash_profile

## Aliases

	Use for long commands

	alias [name[=value]]
	unalias  [name]

	alias cls='clear'

## Environment Variables

	printenv	Displays all environment variables
	printenv PATH
	echo $PATH

	export VAR="value"	Create environment variable
	export EDITOR="vi"

	unser VAR	Remove Environment variable

	$ cat ~/.bash_profile
	export TZ="US/Central"

## Processes and Job Control

	ps	display process status 
		-e Everything
		-f full format
		-u username
		-p pid

	ps -ef	Full list all processes
	ps -eH	Process tree
	pstree	Tree format
	top	Interactive process viewer
	htop	as above

	command &	Start command in background
	Ctrl-c	Kill foreground process
	Ctrl-z	Suspend process
	bg [%num]	Background a suspended process
	fg [%num]	Foreground a background process
	kill	Kill process by job number, or PID 
		-l List all kill signals
	jobs [%num]	List jobs

## Scheduling Repeated Jobs with Cron

	m h d M D command
	0 7 * * 1 /opt/sales/bin/weekly-report	Run every Monday at 07:00

	0 2 * * * /root/backupd > /tmp/backupd.log

	0,15,30,45 * * * *	Run every 15 minutes
	0 0 1 1 *	@yearly
	0 0 1 * * 	@monthly
	0 0 * * 0	@weekly

	crontab file	Install a new crontab from file
	crontab -l	List you cron jobs
	crontab -e	Edit you cron jobs
	crontab -r	Remove all you cron jobs

	vi my-cron
	crontab my-cron

## Switching Users and Running Commands as Others

	su [username]	Change user ID or become superuser 
		-c command
	sudo	Execute as superuser 
		-l List available commands
		-u user command
		-s start root shell
		-u user -s start shell as user
	whoami	show current user
	visudo	Edit the /etc/sudoers file

	su -c 'echo $ORACLE_HOME' - oracle
	sudo su - username

	/etc/sudoers
	user host=(users)[NOPASSWD:]commands
	adminuser ALL=(ALL) NOPASSWD:ALL

## Shell History and Autocompletion

	~/.bash_history
	~/.history
	~/.histfile

	history	Show previous commands
	!N	Repeat command line number N
	!!	Repeat previous command line
	!string	Repreat the most recent commant starting with "string"
	!:N	Event Separator Word
	!^	First argument = !:1
	!$	Last argument

	head files.txt sorted_files.txt notes.txt
	vi !:2 = vi sorted_files.txt

## Installing Softare

### rpm/YUM

	yum search string	Search for string
	yum info [package]	Display Info
	yum install [-y] package	Install package
	yum remove package	Remove package
	rpm -qa	List installed packages
	rpm -qf file	Show package file relates to
	rpm -ql package	List package files
	rpm -ivh package.rpm	Install package
	rpm -e package	Remove package

	yum search inkscape
	yum info inkscape.i686
	sudo yum install inkscape
	yum remove inkscape

	yum search dropbox
	rpm -ivh dropbox.rpm

	rpm -qf /usr/bin/which
	rpm -ql which

### dpkg/APT - Advanced Packaging Tool

	apt-cache search string	Search for a string
	apt-get install [-y] package	Install package
	apt-get remove package	Remove package
	apt-get purge package	Purge package
	apt-cache show package	Display information about package
	dpkg -l	List packages
	dpkg -S /path/file	Display package file belongs to
	dpkg -L package	List all files in package
	dpkg -i package.deb	Install package

	apt-cache search inkscape
	sudo apt-get install inkscape
	sudo apt-get remove inkscape
	
![image](https://user-images.githubusercontent.com/35584158/132084214-5eb12194-17e8-4448-b848-9ba1b0faa70a.png)

