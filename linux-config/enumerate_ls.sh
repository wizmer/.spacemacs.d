# enumerated ls: each ls item is prepended with it's item number
function l {
    ls -rt1 --color $1 | tac | cat -n | tac | sed -s 's/^\s*\([0-9]*\)\s*\(.*\)/ \1  \2/'g
}



# Get the ith item of the `ls -lrt` command
# Example: `ls-get 2` will return the second item
function ls-get() {
    if [ "x${1}" == "x" ]
    then
        n=1
    else
        n="${1}"
    fi
    ls -rt1 | tail -n ${n} | head -n 1
}

function l1 {
    ls-get 1
}

function l2 {
    ls-get 2
}

function l3 {
    ls-get 3
}

function l4 {
    ls-get 4
}

function l5 {
    ls-get 5
}

function l6 {
    ls-get 6
}

function l7 {
    ls-get 6
}

function l8 {
    ls-get 8
}

function l9 {
    ls-get 9
}

function l10 {
    ls-get 10
}


alias 1='cd $(ls-get 1)'
alias 2='cd $(ls-get 2)'
alias 3='cd $(ls-get 3)'
alias 4='cd $(ls-get 4)'
alias 5='cd $(ls-get 5)'
alias 6='cd $(ls-get 6)'
alias 7='cd $(ls-get 7)'
alias 8='cd $(ls-get 8)'
alias 9='cd $(ls-get 9)'
alias 10='cd $(ls-get 10)'
alias 11='cd $(ls-get 11)'
alias 12='cd $(ls-get 12)'
alias 13='cd $(ls-get 13)'
alias 14='cd $(ls-get 14)'
alias 15='cd $(ls-get 15)'
alias 16='cd $(ls-get 16)'
alias 17='cd $(ls-get 17)'
alias 18='cd $(ls-get 18)'
alias 19='cd $(ls-get 19)'
alias 20='cd $(ls-get 20)'
alias 21='cd $(ls-get 21)'
alias 22='cd $(ls-get 22)'
alias 23='cd $(ls-get 23)'
alias 24='cd $(ls-get 24)'
alias 25='cd $(ls-get 25)'
alias 26='cd $(ls-get 26)'
alias 27='cd $(ls-get 27)'
alias 28='cd $(ls-get 28)'
alias 29='cd $(ls-get 29)'
