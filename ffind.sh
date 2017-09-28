#!/bin/bash
EXT=".txt"
NAME="results_"
DT_STAMP=`date`
T_STAMP=`date +"%T"`
file_name=$NAME$T_STAMP$EXT
usr_input=0
file_path=''

perform_search() {
	if [ $SEARCH_WORD ]; then
		working_dir=`pwd`
		results_path="/results/$file_name"
		final_path=$working_dir$results_path
		echo "$(tput setaf 2)::$(tput sgr0) searching..."
		echo ":: date and time: $DT_STAMP" >> $final_path
		echo ":: directory: $file_path" >> $final_path
		echo ":: keyword: $SEARCH_WORD\n" >> $final_path
		cd ~
		cd $file_path # < ---- starting search directory
		find . -name $SEARCH_WORD >> $final_path
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
		perform_search
	elif [ "$usr_input" == "2" ]; then
		echo "$(tput setaf 2)::$(tput sgr0) enter a search word:"
		read -p '>> ' SEARCH_WORD
		echo "$(tput setaf 2)::$(tput sgr0) enter starting directory"
		read -p '>> ' file_path
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
echo "$(tput setaf 2)::$(tput sgr0) ffind: started"
start
