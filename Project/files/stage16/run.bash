#!/bin/bash
. ../../load_env.bash
shopt -s expand_aliases

rm -f disk.xfs
xi fdisk

xi load --library $OS_LAB_PROJ_DIR/myexpos/expl/library.lib

spl os.spl
xi load --os os.xsm

expl odd.expl
xi load --init odd.xsm



expl idle.expl
xi load --idle idle.xsm

xi load --exhandler exhandler.xsm

spl timer.spl
xi load --int=timer timer.xsm

echo "CONSOLE"
spl ./int_console.spl
xi load --int=console int_console.xsm

echo "INT 6"
spl int6_read.spl
xi load --int=6 int6_read.xsm

echo "INT 7"
spl int7.spl
xi load --int=7 int7.xsm

spl int10.spl
xi load --int=10 int10.xsm

echo "MOD 0"
spl mod0_res_mgr.spl
xi load --module 0 mod0_res_mgr.xsm

echo "MOD 4"
spl mod4_dev_mgr.spl
xi load --module 4 mod4_dev_mgr.xsm

echo "MOD 5"
spl mod5_scheduler.spl
xi load --module 5 mod5_scheduler.xsm

echo "MOD 7"
spl mod7_boot.spl
xi load --module 7 mod7_boot.xsm

echo "------------------"
xsm --disk-file disk.xfs --timer 500 $*

