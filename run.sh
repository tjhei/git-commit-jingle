#!/bin/bash

cd repo
git checkout master
hash=`git show --oneline`

while true; do
    git pull
    newhash=`git show --oneline`
    if [ "$newhash" != "$hash" ] ; then
	    echo "change!"
	    hash=$newhash
# Get name of author
      author=`git show --format=%an -s`
      filename="../$author.wav"
#remove whitespaces
      nows_filename="$(echo -e "${filename}" | tr -d '[:space:]')"
# debug
#      echo "$author"
#      echo "$no_filename"
#      echo "$filename"
      	# on OSX use: afplay "sound.wav" -v 10
      if [ -f $nows_filename] ; then
        aplay "$nows_filename"
      else
	# on OSX use: afplay "sound.wav" -v 10
	       aplay "../sound.wav"
      fi
    fi
    sleep 5
done
