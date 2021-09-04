# Shell Scripting

## script.sh

	#!/bin/bash
	echo "Scripting is fun!"

	$ chmod 755 script.sh
	$ ./script.sh
	Scripting is fun!

	#!/usr/bin/python
	print "This is a python script!"

## Variables
	
	VARIABEL_NAME="bash"
	echo "I like the $VARIABLE_NAME shell."
	echo "I like the ${VARIABLE_NAME} shell."

## Assign a command output to a variable
	
	#!/bin/bash
	SERVER_NAME=$(hostname)
	echo "You are running this script on ${SERVER_NAME}."

## Variable Names
	
	Letters, digits, underscores

## Tests
	
	[ condition-to-test-for]
	[ -e /etc/passwd ]

	-d	True, if file is a directory
	-e	file exists
	-f	exists and is a regular file
	-r	file is readable to you
	-s	file exists and is not empty
	-w	exists and is writeable to you
	-x	exists and is executable by you

	arg1 -eq arg2	arg1 = arg2
	arg1 -ne arg2	arg1 != arg2
	arg1 -lt arg2	arg1 < arg2
	arg1 -le arg2	arg1 <= arg2
	arg1 -gt arg2	arg1 > arg2
	arg1 -ge arg2	arg1 >= arg2

## If statement
	
	if [ condition-is-true ]
	then
	  command 1
	  command 2
	else
	 command 3
	fi

## For loop
	
	for VARIABLE_NAME in ITEM_1 ITEM_N
	do
	  command 1
	  command 2
	done

	#!/bin/bash
	COLORS="red green blue"

	for COLOR in $COLORS
	do
	  echo "COLOR: $COLOR"
	done

	#!/bin/bash
	PICTURES=$(ls *jpg)
	DATE=$(date + %F)

	for PICTURE in $PICTURES
	do
	  echo "Renaming ${PICTURE} to ${DATE}-${PICTURE}"
	  mv ${PCITURE} ${DATE}-${PICTURE}
	done

## Postitional Parameters
	
	$ script.sh parameter1 parameter2 parameter3

	$0:"script.sh"
	$1:"parameter1"
	$2:"parameter2"
	$3:"parameter3"

## n Parameters
	
	echo "executing script: $0"
	for USER in $@
	do
	  echo "Archiving user: $USER"
	  # Lock the account
	  passwd -l $USER
	  # Create an archive
	  tar cf /archives/${USER}.tar.gz /home/${UESR}
	done

	User Input (STDIN)
	read -p "PROMPT" VARIABLE
