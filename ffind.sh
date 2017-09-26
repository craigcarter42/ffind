#!/bin/bash
EXT=".txt"
NAME="results_"
DT_STAMP=`date`
T_STAMP=`date +"%T"`
FILE_NAME=$NAME$T_STAMP$EXT
echo ':: ffind: started\n:: 1. basic search\n:: 2. advanced search\n:: enter a value:'
read -p '>> ' VAR_NUM
if [ $VAR_NUM == '1' ]; then
	echo ':: enter a search word:'
	read -p '>> ' SEARCH_WORD
	if [ $SEARCH_WORD ]; then
		echo ':: searching...'
		echo ":: date and time: $DT_STAMP" >>  ~/ffind/results/$FILE_NAME
		echo ":: keyword: $SEARCH_WORD\n" >>  ~/ffind/results/$FILE_NAME
		cd ~
		find . -name $SEARCH_WORD >>  ~/ffind/results/$FILE_NAME
		echo ':: end\n'
		echo ':: displaying last search result: '$FILE_NAME
		cat ~/ffind/results/$FILE_NAME
	else
		echo ':: please enter a search word'
	fi
elif [ $VAR_NUM == '2' ]; then
	echo ':: enter a search word:'
	read -p '>> ' SEARCH_WORD
	echo ':: enter starting directory'
	read -p '>> ' VAR_PATH
	if [ $SEARCH_WORD ]; then
		echo ':: searching...'
		echo ":: date and time: $DT_STAMP" >>  ~/ffind/results/$FILE_NAME
		echo ":: keyword: $SEARCH_WORD\n" >>  ~/ffind/results/$FILE_NAME
		cd $VAR_PATH # < ---- starting search directory
		find . -name $SEARCH_WORD >>  ~/ffind/results/$FILE_NAME
		echo ':: end\n'
		echo ':: displaying last search result: '$FILE_NAME
		cat ~/ffind/results/$FILE_NAME
	else
		echo ':: please enter a search word'
	fi
fi
