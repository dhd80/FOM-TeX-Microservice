#!/bin/sh

LTIME=`stat -c %Z /usr/fomtextempl/deine_inhalte/Kapitel.tex`

while true    
do
	ATIME=`stat -c %Z /usr/fomtextempl/deine_inhalte/Kapitel.tex`

	if [[ "$ATIME" != "$LTIME" ]]
	then
		arara /usr/fomtextempl/*.tex
		texcount /usr/fomtextempl/deine_inhalte/Kapitel.tex > word_count.log
		tlmgr update --list
		LTIME=$ATIME
		echo "Word Count: "
		texcount /usr/fomtextempl/deine_inhalte/Kapitel.tex -quiet -brief
	fi
	# sleep 2
done
