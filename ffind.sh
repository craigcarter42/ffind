#!/bin/bash
#
# CURRENT VERSION 1.0.1
#
# get current date:
DT_STAMP=`date`

# create file name:
ext=".txt"
name="results_"
time_stamp=`date +"%T"`
file_name=$name$time_stamp$ext

# get current working directory and make file path:
working_dir=`pwd`
results_path="/results/$file_name"
final_path=$working_dir$results_path

# general:
usr_input=0
file_path=''
caps='"'
SEARCH_WORD=''
ffind='find . -name '

perform_search() {
	if [ "$SEARCH_WORD" != "" ]; then
		echo "$(tput setaf 2)::$(tput sgr0) searching..."
		if [ $file_path ]; then
			eval cd $file_path # < ---- starting search directory
		else
			eval cd ~
			file_path="~"
		fi
		echo ":: date and time: $DT_STAMP" >> $final_path
		echo ":: directory: $file_path" >> $final_path
		echo ":: keyword: $SEARCH_WORD\n" >> $final_path
		eval $final_search_word >> $final_path
		echo "$(tput setaf 2)::$(tput sgr0) end\n"
		echo "$(tput setaf 2)::$(tput sgr0) displaying last search result: $file_name"
		cat $final_path
	else
		echo "$(tput setaf 1)::$(tput sgr0) invaild input"
		start
	fi
}

start() {
	echo "$(tput setaf 2)::$(tput sgr0) (1) basic search (2) advanced search (3) help (e) exit"
	read -p '>> ' usr_input
	if [ "$usr_input" == "1" ]; then
		echo "$(tput setaf 2)::$(tput sgr0) enter a search word:"
		read -p '>> ' SEARCH_WORD
		final_search_word=$ffind$caps$SEARCH_WORD$caps
		perform_search
	elif [ "$usr_input" == "2" ]; then
		echo "$(tput setaf 2)::$(tput sgr0) enter a search word:"
		read -p '>> ' SEARCH_WORD
		echo "$(tput setaf 2)::$(tput sgr0) enter starting directory"
		read -p '>> ' file_path
		final_search_word=$ffind$caps$SEARCH_WORD$caps
		perform_search
	elif [ "$usr_input" == "3" ]; then
		cat help.txt; echo
		start
	elif [ "$usr_input" == "e" ]; then
		echo "$(tput setaf 1)::$(tput sgr0) ffind exited"
		exit
	else
		echo "$(tput setaf 1)::$(tput sgr0) invaild input"
		start
	fi
}

if [ "$1" = "-f" ] && [ "$3" = "-p" ]; then
	if [ $2 ] && [ $4 ]; then
		echo "$(tput setaf 2)::$(tput sgr0) advanced search"
		SEARCH_WORD=$2
		final_search_word=$ffind$caps$SEARCH_WORD$caps
		file_path=$4
		perform_search
	else
		echo "$(tput setaf 1)::$(tput sgr0) invaild input"
	fi
elif [ "$1" = "-f" ]; then
	if [ $2 ]; then
		echo "$(tput setaf 2)::$(tput sgr0) basic search"
		SEARCH_WORD=$2
		final_search_word=$ffind$caps$SEARCH_WORD$caps
		perform_search
	else
		echo "$(tput setaf 1)::$(tput sgr0) invaild input"
	fi
else
	echo "$(tput setaf 2)::$(tput sgr0) ffind: started"
	start
fi

