#!/bin/bash

_BASE_DIR="$(pwd)"
_FILENAME="results"
_FILETYPE="css"
_MYFILE="$_BASE_DIR/$_FILENAME.$_FILETYPE"
_LOGFILE="$_BASE_DIR/$_FILENAME.log"

_SEARCH_DIR="../../magicmirror/modules'"
_START_DIR="../../list-builder/bash"
_SEARCH_PATTERN="**/*.css";

rm $_MYFILE; rm $_LOGFILE;
touch $_MYFILE; touch $_LOGFILE;

echo "*** START ****"

echo -e " -> $(pwd)";
echo -e " -> $(pwd)" >> $_LOGFILE;
echo -e "\n /***** SYSTEM GENERATED *****/ \n" >> $_MYFILE;

shopt -s globstar nullglob

cd $($_SEARCH_DIR)

for i in **/*.css; do
    echo " + $i"
    echo -e " +  $i" >> $_LOGFILE;

    echo -e "\n /***** GENERATED FROM $i *****/ \n" >> $_MYFILE;
    cat $i >> $_MYFILE;
done

cd $($_START_DIR)

echo "*** DONE ****"