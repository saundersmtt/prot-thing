#!/bin/bash
coderepo=`dirname $0`
. $coderepo/CONFIG


file_list=`ls $pdbs/*.pdb`
tmppdb="./tmp.pdb"
header="./header.txt"
for i in $file_list;do
    filename=`basename $i|awk -F "." '{print $1}'`
    echo $filename
    cat $header $i  > $tmppdb
    $dssp $tmppdb |sponge $tmppdb
    $trim $tmppdb |sponge $tmppdb
    $lowres $tmppdb |sponge $tmppdb
    $numerical $tmppdb > ./output/$filename.numerical
    cp $tmppdb ./output/$filename
done
