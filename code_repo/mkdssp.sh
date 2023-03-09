#!/bin/bash
dssp="/usr/local/Cellar/dssp/4.0.5/bin/mkdssp --output-format dssp"
trim="/Users/msaunders/megascale_project/code_repo/trim_dssp.sh"
lowres="/Users/msaunders/megascale_project/code_repo/lowres.sh"
pdbs="../AlphaFold_model_PDBs"

file_list=`ls $pdbs/*.pdb`
tmppdb="./tmp.pdb"
header="./header.txt"
for i in $file_list;do
    filename=`basename $i|awk -F "." '{print $1}'`
    echo $filename
    cat $header $i  > $tmppdb
    $dssp $tmppdb |sponge $tmppdb
    $trim $tmppdb |sponge $tmppdb
    $lowres $tmppdb > ./output/$filename
done
