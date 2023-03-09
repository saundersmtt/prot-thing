#!/bin/bash

file=$1

numlines=`tail -1 $file|awk '{print $1}'`

tail -n $numlines $file|cut -c 9-17
