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

function i
    ipython
end

function ccat --description "Colorized versioo of the cat command
    You might have to 'pip install pygments' first. But it's worth it !"
    pygmentize -O style=monokai -f console256 -g $argv
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
    Skips results in ./tox folder
    '
    set res (find . -path ./.tox -prune -false -o -name $argv)
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

function l
    ls -lrt $argv
end

function o
    xdg-open $argv
end

function sound-ok --description "Play a sound representing a success"
    aplay /usr/share/sounds/sound-icons/glass-water-1.wav
end

function sound-fail --description "Play a sound representing a failure"
    aplay /usr/share/sounds/sound-icons/guitar-12.wav
end


function ox --description "Run tox and plays a sound depending on the outcome"
    set logfile /tmp/tox.log
    tox $argv --result-json $logfile

    set return_status $status
    if test $status -eq 0
        sound-ok
    else
        echo running fix-tox
        /home/bcoste/.virtualenvs/cdp/bin/code-assist fix-tox $logfile
        # sound-fail
    end
    return $return_status
end


alias acr='git add -u; and git commit --amend --no-edit; and git review'

function gc
    git commit -m "$argv"
end

function gf
    npm run format; and git add -u; git commit -m "format"
end

function gt
    git add -u; git commit -m "fix tests"
end
