#!/bin/bash
EXT=".txt"
NAME="results_"
DT_STAMP=`date`
T_STAMP=`date +"%T"`
FILE_NAME=$NAME$T_STAMP$EXT
VAR_NUM=0
VAR_PATH=""

perfrom_search() {
	if [ $SEARCH_WORD ]; then
		echo ':: searching...'
		echo ":: date and time: $DT_STAMP" >> /Applications/ffind/results/$FILE_NAME
		echo ":: keyword: $SEARCH_WORD\n" >> /Applications/ffind/results/$FILE_NAME
		cd ~
		cd $VAR_PATH # < ---- starting search directory
		find . -name $SEARCH_WORD >> /Applications/ffind/results/$FILE_NAME
		echo ':: end\n'
		echo ':: displaying last search result: '$FILE_NAME
		cat /Applications/ffind/results/$FILE_NAME
	else
		echo ':: please enter a search word'
	fi
}

echo ':: ffind: started\n:: (1) basic search (2) advanced search'
read -p '>> ' VAR_NUM
if [ $VAR_NUM == '1' ]; then
	echo ':: enter a search word:'
	read -p '>> ' SEARCH_WORD
	perfrom_search
elif [ $VAR_NUM == '2' ]; then
	echo ':: enter a search word:'
	read -p '>> ' SEARCH_WORD
	echo ':: enter starting directory'
	read -p '>> ' VAR_PATH
	perfrom_search
else
	echo ':: invaild input'
fi
