export PS_MODE="[OS Lab] "
export OS_LAB_PROJ_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
export PATH=$PATH:$OS_LAB_PROJ_DIR/bin

files_dir=$OS_LAB_PROJ_DIR/files
disk_file="$files_dir/disk.xfs"

alias wd="cd $files_dir"
alias xi=xfs-interface
alias nxi=nexfs-interface

alias r="./run.bash"
alias rd="./run.bash --debug"

alias l="ls $files_dir"

function _s() {
    if [ -z "$2" ]; then
        dir=stage$1
    else
        dir=stage$1_assg$2
    fi
    echo $dir
}

function s() {
    if [ -z "$1" ]; then
        echo "Syntax: s <stage> [<assg>]"
        return
    fi

    dir=$(_s $*)

    if [ -d "$files_dir/$dir" ]; then
        cd $files_dir/$dir
    else
        echo "Invalid directory: $dir"
        echo "Available:"
        ls $files_dir
    fi
}

function v() {

    if [ -z "$2" ]; then
        f="$1"
        d="."
    else
        f="$2"
        d=$files_dir/$(_s "$1")
    fi

    expl=($d/*$f*.expl)
    spl=($d/*$f*.spl)
    xsm=($d/*$f*.xsm)
    all=($d/*$f*)


    if [ ${#expl[@]} -eq 1 -a -f $expl ]; then
        nvim $expl;
    elif [ ${#spl[@]} -eq 1 -a -f $spl ]; then
        nvim $spl;
    elif [ ${#xsm[@]} -eq 1 -a -f $xsm ]; then
        nvim $xsm;
    elif [ ${#all[@]} -eq 1 -a -f $all ]; then
        nvim $all;
    elif [ ${#all[@]} -gt 1 ]; then
        echo "Files for query:"
        for f in ${all[@]}; do
            echo $(basename $(dirname $f))/$(basename $f)
        done
    else
        echo "No file found for query."
    fi
}

function sc() {
    ag $* $OS_LAB_PROJ_DIR/myexpos/spl/splconstants.cfg
}

function pg() {
    echo $1/512 | bc;
    echo $1%512 | bc;
}

function mem() {
    echo $1*512 | bc;
}

function c() {
    echo "$*" | bc;
}
