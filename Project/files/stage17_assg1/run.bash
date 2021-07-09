#!/bin/bash
. ../../load_env.bash
shopt -s expand_aliases

rm -f disk.xfs
xi fdisk

xi load --library $OS_LAB_PROJ_DIR/myexpos/expl/library.lib

spl os.spl
xi load --os os.xsm

expl init.expl
xi load --init init.xsm

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

echo "INT 9"
spl int9_exec.spl
xi load --int=9 int9_exec.xsm

spl int10.spl
xi load --int=10 int10.xsm

echo "MOD 0"
spl mod0_res_mgr.spl
xi load --module 0 mod0_res_mgr.xsm

echo "MOD 1"
spl mod1_process_mgr.spl
xi load --module 1 mod1_process_mgr.xsm

echo "MOD 2"
spl mod2.spl
xi load --module 2 mod2.xsm

echo "MOD 4"
spl mod4_dev_mgr.spl
xi load --module 4 mod4_dev_mgr.xsm

echo "MOD 5"
spl mod5_scheduler.spl
xi load --module 5 mod5_scheduler.xsm

echo "MOD 7"
spl mod7_boot.spl
xi load --module 7 mod7_boot.xsm

echo "odd.expl"
expl odd.expl
xi load --exec odd.xsm

echo "------------------"
xsm --disk-file disk.xfs --timer 500 $*

