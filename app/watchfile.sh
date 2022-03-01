#!/usr/bin/bash

# https://superuser.com/questions/181517/how-to-execute-a-command-whenever-a-file-changes
# Thanks to VDR and Pablo A

### Set initial time of file

LTIME=`stat -c %Z /usr/fomtextemplate/deine_inhalte/Kapitel.tex`

while true    
do
	ATIME=`stat -c %Z /usr/fomtextemplate/deine_inhalte/Kapitel.tex`

	if [[ "$ATIME" != "$LTIME" ]]
	then
		texcount /usr/fomtextemplate/deine_inhalte/Kapitel.tex > word_count.log
		arara *.tex
		LTIME=$ATIME
		echo "Word Count: "
		texcount /usr/fomtextemplate/deine_inhalte/Kapitel.tex -quiet -brief
	fi
	# sleep 2
done
