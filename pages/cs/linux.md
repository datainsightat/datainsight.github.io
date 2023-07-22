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
    
### Create Symbolic Links

    ln -s target_file link_name
    
    realpath link_name

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
    $ find . -name '*v9*'
    $ find . -iname "*.SomeExt" | xargs cp -t Directory

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
    
## curl

Get file from internet source.

    curl http://some.url --output some.file

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
	
# The Linux Boot Process

## BIOS

Lilo, Grub

## Initrd

Initial RAM disk

## /boot Directory

vmlinuz
initrd.img > Initital RAM disk

## Kernel Ring Buffer

	dmesg
	/var/log/dmesg

## Runlevels

	0	Shut down
	1	Single user
	2	Multi user
	3	Multi user text mode
	5	Multi user graphical interface
	6	reboot

## Init

	/etc/inittab
	Id:3:initdefault;

## Systemd

	systemctl get-default

	/lib/systemd/system
	ls -l runlevel5.target
	systemctl set-default graphical.target

	telinit 5
	systemctl isolate graphical.target

## Rebooting

	telinit 6
	systemctl isolate reboot.target
	reboot

	shutdown -r 15:30 "rebooting at 15:30"

## Poweroff

	telinit 8
	systemctl isolate poweroff.target
	poweroff

## Syslog

	Facilities
	0	kern	kernel messages
	1	user	user-level messages
	2	mail	mail system
	3	daemon	system deamons
	4	auth	security messages
	5	syslog	messages generated by syslogd
	6	lpr	line printer subsystem
	7	news	network news subsystem
	8	uucp	UUCP system
	9	clock	daemon
	10	authpriv	security messages
	11	ftp	ftp system
	15	cron	crontab

	syslogd, rsyslog

	/etc/rsyslog.conf

	$ IncludeConfig /etc/rsyslog.d/*.conf

	Selector field	Action field

	mail.*	/var/log/mail.log
	mail.info	-/var/log/mail.log

	logger  [options] message

	$ logger -p mail.info -t mailtest "Test."

	/etc/logrotate.conf

	logrotate.conf
		weekly
		rotate 4
		create
		compressed
		include /etc/logrotate.d
		
# Disk Management

## Partitions

	$ df -h

## MBR

## GPT

	GPT = GUID Partition Table
	GUID = Global Unique Identifier
	GPT replaces MBR

	Part of UEFI
	UEFI = Unified Extensible Firmware Interface
	UEFI is replacing BIOS

## Mount Point

	/ … is always a mount point

	$ mkdir /home/sarah
	$ mount /dev/sdb2 /home

	$ umount /home

## fdisk

	fdisk /path/to/device

	$ fdisk -l | less
	$ fdisk /dev/sdb

## File Systems

	ext = Extended file system (ext4)

	$ mkfs -t TYPE DEVICE
	$ mkfs -t ext4 /dev/sdb3

	$ mount
	$ df -h

	$ mount /dev/sdb3 /opt
	$ umount /opt
	$ umount /dev/sdb3

## Persistance

Add entry to /etc/fstab

## Preparing Swap space

	$ mkswap /dev/sdb1
	$ swapon /dev/sdb1
	$ swapon -s

## /etc/fstab
	• device
	• mount point
	• file system type
	• mount options
	• dump
	• fsck order

	$ lsblk -f
	$ e2label /dev/sdb3 opt

## Mount img

	$ fdisk -l path/to/image.img
	$ sudo mount -t auto -o loop,offset=$((499712*512)) path/to/image.img /mount/point
	
# LVM Logical Volume Manager

## Layers of Abstraction

Create filesystems that extend over many physical storage devices.
Migrate data from one storage device to another.
Increase throughput by allowing your system to read data in parallel.
Mirror data for fault tolernace.
Create snapshots for backups.

Storage Devices > Physical Volumens (PV) (Sum of Logical Extends (PE)) > Volume Group (VG) > Logical Volume (LV) (Sum of Logical Extends (LE))> File Systems

## Logical Volume Creation Process

PV > VG > LV

	$ su -
	$ lvmdiskscan
	$ lsblk
	$ lsblk -p
	$ df -h
	$ fdisk -l

	$ pvcreate /dev/sdb
	$ pvs
	$ vgcreate vg_app /dev/sdb
	$ vgs
	$ pvs
	$ lvcreate -L 20G -n lv_data vg_app
	$ lvs
	$ lvdisplay

	$ mkfs -t ext4 /dev/vg_app/lv_app
	$ mkdir /data
	$ mount /dev/vg_app/lv_app /data
	$ df -h /data
	$ lvcreate -L 5G -n lv_app vg_app
	$ lvs

	$ mkfs -t ext4 /dev/vg_app/lv_app
	$ mkdir /app
	$ vi /etc/fstab
	$ /dev/vg_app/lv_app /app ext4 default 0 0
	$ mount /app
	$ df -h

	$ ls -l /dev/vg_app/lv_app
	$ ls -l /dev/mapper/vg_app-lv_app
	$ ls -l /dev/dm-1

	$ vgs
	$ lvdisplay -m
	$ lcreate -l 100%FREE -n lv_logs vg_app
	$ lvs

## Extending Volume Groups

	$ vgs
	$ lvmdiskscan
	$ pvcreate /dev/sdc
	$ vgextend vg_app /dev/sdc
	$ vgs
	$ pvs
	$ df -h /data
	$ lvextend -L  +5G -r /dev/vg_app/lv_data
	$ lvs
	$ df -h /data

	$ resize2fs /dev/vg_app/lv_data

	$ lvdisplay -m /dev/vg_app/lv_data

## Mirroring Logical Volumes

	$ lvmdiskscan
	$ pvcreate /dev/sdd /dev/sde
	$ pvs
	$ vgcreate vg_save /dev/sdd /dev/sde
	$ vgs
	$ lvcreate -m 1 -L5G lv_secrets vg_save
	$ lvs
	$ lvs -a

	$ pvdisplay -m
	$ mkfs -t ext4 /dev/vg_safe/lv_secrets
	$ mkdir /secrets
	$ mount /dev/vg_save/lv_secrets /secrets
	$ df -h /secrets

## Removing Logical Volumes, Volume Groups, Physical Volumes

	$ umount /secrets
	$ lvremove /dev/vg_safe/lv_secrets
	$ vgs
	$ vgreduce vg_save /dev/sde
	$ pvremove /dev/sde
	$ vgremove vg_save
	$ vgs
	$ pvs
	$ pvremov /dev/sdd
	$ pvs

## Migrating Data from on Storage Device to Another

	$ pcreate /dev/sde
	$ vgextend /dev/sde
	$ pvs
	$ pvmove /dev/sdb /dev/sde
	$ pvs
	$ pvdisplay /dev/sdb
	$ vgreduce vg_app /dev/sdb
	$ pvremove /dev/sdb

# Managing Users and Usergroups

	/etc/passwd
	username:password:UID:GID:comments:home_dir:shell
	joe:x:1000:1000:Joe Henderson:/home/joe:/bin/bash

	$ ps -fu joehenderson

## Password Info

	/etc/shadow

## UID

	root = UID 0

## GID

	default group for an account
	newgrp > change group

## /etc/shells

	List of available shells

## useradd

useradd [options] username

	-c	comment
	-m 	create a home directory
	-s /shell/path	path to the user's shell
	-g	default group
	-G group1, group2	additional groups
	-r	system account
	-d /home/directory	path to home directory
	-u	specify UID

	$ useradd -c "Grant Stewart" -m -s /bin/bash grant
	$ useradd -c "Eddie Harris" -m -s /bin/bash -g sales -G projectx

	$ useradd -c "Apache Web Server User" -d /opt/apache -r -s /usr/bin/nologin apache

	$ useradd -c "MySQL Server" -d /opt/mysql -u 97 -s /bin/sbin/nologin mysql

## passwd
	
	$ passwd grant

## userdel

	$ ls /home
	eharris grant
	$ userdel eharris
	$ls /home
	eharris grant
	$ userdel -r grant
	$ ls /home
	eharris

## usermod
	
	-c	comment
	-g group	specify primary group
	-G group1, group2	additional groups
	-s /shell/path	user shell

	$ usermod -c "Mysql User" mysql

## /etc/group
	
	group_name:password:GID:account1, account2

## groups
	
	$ groups root

### groupadd
	
	$ groupadd web
	-g	group id

	$ groupadd -g 2500 db

### groupdel
	
	$ groupdel db

### groupmod
	
	groupmod [options] group_name

	-g gid	change gid
	-n group	rename group

	$ groupmod -g 1234 web
	$ groupmod -n web http

### Demonstration

	$ groupadd writers
	$ groupadd tv
	$ groupadd movie

	$ tail -3 /etc/group

	$ useradd -c "Carlton Cuse -g writer -G tv -m -s /bin/bash ccuse
	$ passwd ccuse
	$ groups ccuse

	$ useradd -c "David Fury" -g writers -G tv -m -s /bin/bash dfury
	$ passwd dfury
	$ groups dfury

	$ useradd -c "Matt Damon" -g writers -G movie -m -s /bin/bash mdamon
	$ pwasswd mdamon

	$ useradd -c "Ben Affleck" -g writers -G movie, tv -m -s /bin/bash baffleck
	$ passwd baffleck

	$ tail -3 /etc/group

	$ grep 1002 /etc/passwd

## Change File Owner

	sudo chown -R $USER ~/.blabla

# Networking

## TCP/IP
	
	TCP	control data exchange
	IP	Internet protocol send data from a device to another

	IP address	subnet mask	broadcast address
	199.83.131.186	255.255.255.0	199.83.131.255

	Netword Address	What the host belongs to
	Hoast Address	Specific host address

### Classful Networks
	
	Class	Network	Hosts
	A	1.0 > 127.0	16.777.216
	B	128.0 > 191.255	65.536
	C	192.0.0 > 233.255.255	255

### Subnet Masks
	
	Class	Subnet Mask
	A	255.0.0.0
	B	255.255.0.0
	C	255.255.255.0

### Broadcast Address
	
	Broadcasts messages to all hosts in network
	Class	Network	Subnet Mask	Boradcast
	A	17.0.0.0	255.0.0.0	17.255.255.255
	B	183.194.0.0	255.255.0.0	183.194.255.255
	C	199.83.131.0	255.255.255.0	199.83.131.255

### Classless Inter-Domain Routing / CIDR
	
	IP: 121.67.198.94
		Class A network: 121.0.0.0
		Class A subnet: 255.0.0.0
		Class A bradcast: 121.255.255.255

	IP: 121.67.198.94 Subnet: 255.255.255.0
		CIDR network: 121.67.198.0
		CIDR subnet: 255.255.255.0
		CIDR broadcast: 121.67.198.255

### Reserved Private Address Space
	
	Class	Range	Private Address Space
	A	1.0.0.0 - 127.255.255.255	10.0.0.0 - 10.255.255.255
	B	128.0.0.0 - 191.255.255.255	172.16.0.0 - 172.31.255.255
	C	192.0.0.0 - 233.255.255.255	192.168.0.0 - 192.168.255.255

## DNS and hostnames

### ip address
	
	$ ip address

### ifconfig
	
	$ ifconfig

### hostnames
	
	human readable name for an IP address

### DNS hostnames
	
	FQDN fully qualified domain name
		webprod01.mycompany.com

	TLD
		.com, .net …

	domain
		left of TLD

	subdomain
		left of domain

### hostname
	
	$ hostname
	$ uname -n
	$ hostname -f
	$ hostname webprod01
	$ echo 'webprod01' > /etc/hostname

### host
	
	$ host www.mycompany.com

### /etc/hosts
	
	127.0.01	localhost
	1.2.1.6	webprod01.mycompany.com
	10.11.13.7	dbcluster

### /etc/nsswitch.conf
	
	NSS = Name Service Switch

	hosts: files dns
	hosts: files nis dns

## DHCP
	
Dynmaic host configuration protocol

### Network Ports
	
	1-1023	System ports
	22	ssh
	25	smtp
	80	http
	143	imap
	389	ldap
	443	https

### Configure DHCP Client
	
	ifconfig -a
	ip link

### DHCP Client RHEL
	
	/etc/sysconfig/betwork-scripts/ifcfg-device
	BOOTPROTO=dhcp

### DHCP Client Ubuntu
	
	auto eth0
	iface etth0 inet dhcp

### Static IP RHEL
	
	/etc/sysconfig/network-scripts/ifcfg-eth0
	DEVICE=eth0
	BOOTPROTO=static
	IPADDR=10.109.155.174
	NETMASK=255.255.255.0
	NETWORK=10.109.155.0
	BROADCAST=10.109.155.255
	GATEWAY=10.109.155.1
	ONBOOT=yes

### Static IP Address Ubuntu
	
	/etc/network/interfaces
	auth eth0
	iface eth0 inet static
	  address 10.109.155.174
	  netmask 255.255.255.0
	  gateway 10.109.155.1


### Manually Assign IP Address
	
	$ ip address add 10.11.12.13 dev eth0
	$ ip address add 10.11.12.13/255.255.255.0 eth0
	$ ip link set eth0 up

	$ ifconfig eth0 10.11.12.13
	$ ifconfig eth0 10.11.12.13 netmask 255.255.255.0
	$ ifconfig eth0 up

### ifup/ifdown
	
	$ ifup eth0
	$ ifdown eth0

### GUI/TUI Tools
	
	$ nmtui
	$ YaST

## Network Troubleshooting
	
	ping
	traceroute
	netstat
	tcpdump
	telnet

	ping -c COUNT HOST
	$ ping -c 3 google.com
	$ traceroute -n google.com
	$ tracepath -n google.com

### netstat
	
	netstat	Analyse network
	-n	Numerical addresses
	-i	list of network interfaces
	-r	route table (netstat -rn)
	-p	pid and program
	-l	listening sockets (netstat -nlp)
	-t	limit output to tcp (netstat -ntlp)
	-u	limit output to udp (netstat -nulp)

	$ netstat -i
	$ netstat -rn
	$ sudo netstat -ntlp

### Packet sniffing tcpdump
	
	tcpdump	Sniff packages
	-n	numerical addresses and ports
	-A	ASCII output
	-v	Verbose mode
	-vvv	Even more output

	$ sudo tcpdump
	$ sudo tcpdump -Anvvv

### telnet
	
	$ telnet google.com 80
	$ GET /
	$ ^]
	$ quit
	
# Advanced Command Line

## Tab completion
	
	$ host<TAB>
	$ host<TAB><TAB>

## Repeat as Root
	
	$ sudo !!

## Reuse Arguments
	
	$ !*

## Strip out comments and blank lines
	
	$ grep -Ev '^#|^$' file.txt

## SSH Connection

	$ ssh-keygen -t rsa -m PEM -b 4096 -C "<your-email-here>"
 	$ ssh-keygen -R <host_name> -f ~/.ssh/known_hosts
 	
