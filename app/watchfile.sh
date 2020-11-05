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
       arara thesis.tex
       LTIME=$ATIME
   fi
   sleep 25
done
