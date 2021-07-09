#!/bin/bash
. ../../load_env.bash
shopt -s expand_aliases

rm -f disk.xfs
xi fdisk
spl os.spl
xi load --os os.xsm
xi load --init init.xsm
xi load --exhandler exhandler.xsm
spl timer.spl
xi load --int=timer timer.xsm
spl int7.spl
xi load --int=7 int7.xsm
xi load --int=10 int10.xsm
xsm --disk-file disk.xfs --timer 100 $*
