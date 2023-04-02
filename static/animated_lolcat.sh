#!/bin/bash

counter=0

while :; do
	counter=$((counter + 1))
	tput cup 0 0
	lolcat -t -p 2 -F 0.05 "$1" -S $counter -f
	# sleep .1
done
