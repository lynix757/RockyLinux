#!/bin/bash

if [ $1 == "abc" ] 
then
	tr -dc A-Za-z0-9 </dev/urandom | head -c $2 ; echo ''
else
	tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c $2  ; echo
fi
