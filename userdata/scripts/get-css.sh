#!/bin/bash

 _BASE="/opt/magicmirror/modules"
_TARGET="$_BASE/modules"
_LOGFILE="$_BASE/output.log"
_CSSFILE="$_BASE/output.css"
_
mv $_LOGFILE $_LOGFILE.bk
mv $_CSSFILE $_CSSFILE.bk

echo "*** START ****"

echo -e " - $_TARGET";
echo -e "\n/********************\n*  SYSTEM GENERATED *\n********************/\n" > $_CSSFILE;
echo -e "\n#********************\n#  SYSTEM GENERATED \n#********************\n" > $_LOGFILE;

shopt -s globstar nullglob

for i in **/*.css; do
    echo " + $i"
    echo -e " +  $i" >> $_LOGFILE;

    echo -e "\n /***** GENERATED FROM $i *****/ \n" >> $_CSSFILE;
    cat $i >> $_CSSFILE;
done

# cd ../_scripts

echo "*** DONE ****"
