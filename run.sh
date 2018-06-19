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
	# on OSX use: afplay "sound.wav" -v 10
	aplay "../sound.wav"
    fi
    sleep 5
done
