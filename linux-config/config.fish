# Path to Oh My Fish install.
set -q XDG_DATA_HOME
and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

function gpfs
    sshfs bbpviz2.bbp.epfl.ch:/gpfs /gpfs -o reconnect
end

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

function pipi
    pip install $argv
end

function gca
    git commit --amend --no-edit
end


# . "$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null and pwd )"/enumerate_ls.sh

function github
    git clone git@github.com:$argv[1] $argv[2]
end

function gerrit
    git clone "ssh://bbpcode.epfl.ch:22/$argv[1]" $argv[2]
end

function ip
    ipython
end

function ccat --description "Colorized version of the cat command
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

function c --description "a 'cd' followed by 'ls -lrt'"
    cd $argv[1] and l
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
    line=$argv[1]
    col=$argv[2]

    if [[ "$line" == "" ]]; then
        line=1
    end

    if [[ "$col" == "" ]]; then
        col=9
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

function lf --description 'Return the last modified file in the current directory'
    ls -Art | tail -n 1
end

function lastless --description 'Open less on the last modified file'
    less (lf)
end

function lastvim --description 'Open vim on the last modified file'
    vim (lf)
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

eval (python -m virtualfish auto_activation global_requirements projects)
# source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
# source $HOME/.spacemacs.d/linux-config/bash_aliases
# source $HOME/.rvm/scripts/rvm # Load RVM into a shell session *as a function*
# source /home/bcoste/.nix-profile/etc/profile.d/nix.sh # added by Nix installer
# alias dvorak='setxkbmap -layout us -variant dvp'



set DEVPI_ARG --index-url "https://bbpteam.epfl.ch/repository/devpi/bbprelman/dev/+simple/"
set CDPATH . /home/bcoste/workspace/nexus/ /home/bcoste/workspace/nse /home/bcoste/workspace/infra /home/bcoste/workspace/hbp /home/bcoste/workspace/morphology/ /home/bcoste/workspace/hpc/
source ~/bin/nexus-cli.fish

set NEXUS_TOKEN "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJONS1CU0ZxZG5NS3Y4SWtKUkg1R3E0LVA2c1RWQUxwU0EydGNQeEpWM1NBIn0.eyJqdGkiOiI1Yzg5ZTJmZC02MTk3LTQ2YWUtYWMyNi05MzgzZDgwYzJjMGYiLCJleHAiOjE1MzcyNTUxNTQsIm5iZiI6MCwiaWF0IjoxNTM2NjUwMzU0LCJpc3MiOiJodHRwczovL2JicHRlYW0uZXBmbC5jaC9hdXRoL3JlYWxtcy9CQlAiLCJhdWQiOiJiYnAtbmV4dXMtc3RhZ2luZyIsInN1YiI6ImY6OWQ0NmRkZDYtMTM0ZS00NGQ2LWFhNzQtYmRmMDBmNDhkZmNlOmJjb3N0ZSIsInR5cCI6IkJlYXJlciIsImF6cCI6ImJicC1uZXh1cy1zdGFnaW5nIiwiYXV0aF90aW1lIjoxNTM2NjUwMzU0LCJzZXNzaW9uX3N0YXRlIjoiNDAyMmI4OGQtNWNhZi00MjExLWJhMjMtYWUyNmNjMDM3Y2NlIiwiYWNyIjoiMSIsImFsbG93ZWQtb3JpZ2lucyI6WyIvKiJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsib2ZmbGluZV9hY2Nlc3MiLCJ1bWFfYXV0aG9yaXphdGlvbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoib3BlbmlkIG5leHVzIiwibmFtZSI6IkJlbm_DrnQgSmVhbi1BbGJlcnQgQ29zdGUiLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJiY29zdGUiLCJnaXZlbl9uYW1lIjoiQmVub8OudCBKZWFuLUFsYmVydCIsImZhbWlseV9uYW1lIjoiQ29zdGUiLCJlbWFpbCI6ImJlbm9pdC5jb3N0ZUBlcGZsLmNoIn0.VhyQp_UivG-0sLXGmNqbsLKTJOyce_v-yEPAl_ya0aOe1fgzEKFgbcR1eP_e_iXokt2exGYdKOF9nGAP1ar3Q40LRZwzaMMHU2wn6AMpg5IkyFLt8d6nBNAKXCDC9L9GEhstTU1LQ1Bz3Okm4FdpnPKWF4jY1jKrwe4M9d0p0Webu9ITpTvl9JDKrWrikKD3qX0G8d_CDzN1AXKnLPivzBicZ5NLvK-xX1w4ns1q4gTGkFQZpuumzLVVqaVKrRO0dVykPrIzC17eSLaKM1M_8igqyEMuMFDPYYL51c9UrAA7mfi7GeqG_pbSh87O0vGUAZ4x1h-uF2xTTQIQgSC2uw"
