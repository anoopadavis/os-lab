#!/bin/bash
. ../../load_env.bash
shopt -s expand_aliases

xi fdisk
echo "Load as exception handler...";
xi load --exhandler exception_handler.xsm
echo "Dump exception handler...";
xi copy 15 15 dump.txt

echo "Verify dumped code..";
echo
python check.py dump.txt
if [ $? -eq 0 ]; then
    echo "----------------------------"
    echo "Label is resolved correctly.";
else
    echo "----------------------------"
    echo "Label is resolved incorrectly."
fi;
