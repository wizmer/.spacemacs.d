set -g theme_vcs_ignore_paths /gpfs


function bb5
    ssh -X bbpv1.epfl.ch
end

function em
    emacs -nw $argv
end

function ..
    cd ..
end
function ...
    cd ../..
end

function ....
    cd ../../..
end

function .....
    cd ../../../..
end

function ......
    cd ../../../../..
end

function morph-view
    neurom view --backend plotly $argv
end

function pipi
    pip install $argv
end

function gca
    git commit --amend --no-edit
end

function acr
    git add -u
    git commit --amend --no-edit
    git review
end

function my-diff
    git diff master:$argv[1] $argv[2]
end

# . "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null and pwd )"/enumerate_ls.sh

function github
    git clone git@github.com:$argv[1] $argv[2]
end

function gerrit
    git clone "ssh://bbpcode.epfl.ch:22/$argv[1]" $argv[2]
end

function rchmod --argument-names 'directory' 'd_chmod' 'f_chmod'
    if test -n "$d_chmod":
        set d_chmod 755
    end
    if test -n "$f_chmod":
        set f_chmod 664
    end
    find $directory -type d -exec chmod $d_chmod {} \;
    find $directory -type f -exec chmod $f_chmod {} \;
end

# function ip
#     ipython
# end

function ccat --description "Colorized versioo of the cat command
    You might have to 'pip install pygments' first. But it's worth it !"
    pygmentize -O style=monokai -f console256 -g $argv
end

function urpad
    ssh -X bcoste@209.148.83.200
end

function cdl --description "cd to the most recently modified directory (mnemonic: cd last)"
    set dir (ls -lrtd */ | tail -1 | awk '{print $9}')
    cd $dir
end

function o --description "open file as if double-clicked on"
    xdg-open $argv
end

function e --description "Open a file in Emacs"
    emacsclient -n $argv[1]
end

function sel --description "
    Filter the input to select the given line and row
    Example: ls -lrt | sel 2 8 # to get the modification time of the 2nd file
    To be used in conjonction with the pipe to select a given line and column from stdout"
    set line $argv[1]
    set col $argv[2]

    if [[ "$line" == "" ]]; then
        set line 1
    end

    if [[ "$col" == "" ]]; then
        set col 9
    end

    set count 1
    while [ $count -le $line ]
        read str
        set count (math $count + 1)
    end

    if [[ "$col" -eq "0" ]]; then
        echo $str
    else
        echo $str | awk '{print $'$col'}'
        fi
    end
end

function clip --description '
    Copy the output of the command to clipboard
    Example: "clip pwd" to copy the current path to clipboard
    '
    eval $argv | xclip -selection clipboard
end

function compare-plot --description "Compare neurom morph from different folders"
    neurom view --backend plotly /gpfs/bbp.cscs.ch/project/proj83/home/gevaert/morph-release/morph_release_new_code-2020-09-01/output/04_RepairUnravel/unravel_output/$argv[1] $argv[2] $argv[3]
    sleep 10
    neurom view --backend plotly /gpfs/bbp.cscs.ch/project/proj83/home/gevaert/morph-release/morph_release_new_code-2020-09-01/output/04_RepairUnravel/$argv[1] $argv[2] $argv[3]
    sleep 10
    neurom view --backend plotly /gpfs/bbp.cscs.ch/project/proj83/home/gevaert/morph-release/morph_release_old_code-2020-07-27/output/06_RepairUnravel/$argv[1] $argv[2] $argv[3]
end

function c --description "clip path"
    clip realpath $argv
end

function cdls --description "a 'cd' followed by 'ls -lrt'"
    cd $argv[1] and l
end

function z --description 'Copy the argument to clipboard'
    echo $argv | xclip -selection clipboard
end


function f --description '
    Recursively search for a file starting a current dir
    and copy result to clipboard
    '
    set res (find . -name $argv)
    clip echo $res
    printf '%s\n' "$res"
end

function lf --description 'Return the last modified file in the directory'
    echo (realpath "$argv")"/"(ls -Art $argv | tail -n 1)
end

function ol --description "open the most recently modified file of the directory (mnemonic: open last)"
    o (lf $argv)
end

function lastless --description 'Open less on the last modified file'
    less (lf $argv)
end

function lastvim --description 'Open vim on the last modified file'
    vim (lf)
end

function rgrep-all --description 'rgrep but excluting unwanted dirs'
    find . \( -name .tox -prune \) -o -name "*.py" -exec grep --color -Hn "$argv" \{\} 2>/dev/null \;
end

# function foreach --description '
#     Call first argument (which has to be a function) with each other arguments
#     Example: foreach xdg-open *.png
#     '
#     func=$argv[1]
#     for f in "${@:2}"; do
#         $func $f
#     end
# end


function l
    ls -lrt $argv
end

function o
    xdg-open $argv
end

function root
	  echo "mounting $argv in /blah"
	  docker run -it -u 0 --rm --entrypoint /bin/bash -v $argv:/blah centos
end

# alias dvorak='setxkbmap -layout us -variant dvp'



set DEVPI --index-url "https://bbpteam.epfl.ch/repository/devpi/bbprelman/dev/+simple/"
set CDPATH . $HOME/workspace/

set -x EDITOR vim

# set -x CC clang
# set -x CXX clang

function ox --description "Run tox and plays a sound depending on the outcome"
    tox $argv
    set return_status $status
    if test $status -eq 0
        aplay /usr/share/sounds/sound-icons/glass-water-1.wav
    else
        aplay /usr/share/sounds/sound-icons/guitar-12.wav
    end
    return $return_status
end


alias acr='git add -u; and git commit --amend --no-edit; and git review'
alias m='morpheus'
alias ma='morpheus-admin'

set -x PATH $HOME/.local/bin $PATH

switch (uname)
    case Darwin
        . ~/.spacemacs.d/linux-config/config-macos.fish
end
