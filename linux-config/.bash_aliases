# -*- mode: shell-script -*-

alias ip='ipython'
alias e='emacs -nw -Q'
alias em='emacs -nw'
alias o='xdg-open'
alias f='find . -name'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cdlast='cd  "$(\ls -1dt ./*/ | head -n 1)"'

alias urpad='ssh -X bcoste@209.148.83.200'

# cd to the most recently modified directory
function cdl {
    dir=$(ls -lrtd */ | tail -1 | awk '{print $9}')
    cd $dir
}

function c {
    cd $1 && ls -lrt;
}

function sel(){
    # To be used in conjonction with the pipe to select a given line and column from stdout
    line=$1
    col=$2

    if [[ "$line" == "" ]]; then
        line=1
    fi

    if [[ "$col" == "" ]]; then
        col=9
    fi

    count=1
    while [ $count -le $line ]
    do
        read str
        (( count++ ))
    done

    if [[ "$col" -eq "0" ]]; then
        echo $str
    else
        echo $str | awk '{print $'$col'}'
    fi
}
