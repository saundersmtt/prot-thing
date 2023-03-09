#!/bin/bash

filename=$1
sed -e 's/H/1/g' -e 's/B/2/g' -e 's/E/3/g' -e 's/G/4/g' -e 's/I/5/g' -e 's/P/6/g' -e 's/T/7/g' -e 's/S/8/g' -e 's/-/9/g' $filename

