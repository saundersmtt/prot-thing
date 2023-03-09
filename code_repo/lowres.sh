#!/bin/bash

#cat 2LXK|awk '{if ($4 == "B") print $1,$3,$4,"H" ;else print $1,$3,$4,$4}'
filename=$1

awk '{
if ( $4 == "G" || $4 == "P" || $4 == "I" || $4 == "E" ) print $1,$3,$4,"H" ;else if ( NF != 4  ) print $1,$3,"-","-";else print $1,$3,$4,$4}' $filename

