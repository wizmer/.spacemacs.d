# Path to Oh My Fish install.
set -q XDG_DATA_HOME
and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
or set -gx OMF_PATH "$HOME/.local/share/omf"

# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

function gpfs
    # sshfs bbpv1.epfl.ch:/gpfs /gpfs -o reconnect
    mount_gpfs
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

function mm
    cd /gpfs/bbp.cscs.ch/project/proj68/model-management/o1-mm
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

set -x NEXUS_TOKEN "Bearer eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJONS1CU0ZxZG5NS3Y4SWtKUkg1R3E0LVA2c1RWQUxwU0EydGNQeEpWM1NBIn0.eyJqdGkiOiJmNTA2NzMwNS0zYzI4LTQ3OGMtYjIyNS1mMGM4NjQ2YzljYjEiLCJleHAiOjE1NDQwODUyNjUsIm5iZiI6MCwiaWF0IjoxNTQzNDgwNDY1LCJpc3MiOiJodHRwczovL2JicHRlYW0uZXBmbC5jaC9hdXRoL3JlYWxtcy9CQlAiLCJhdWQiOiJiYnAtbmV4dXMtc3RhZ2luZyIsInN1YiI6ImY6OWQ0NmRkZDYtMTM0ZS00NGQ2LWFhNzQtYmRmMDBmNDhkZmNlOmJjb3N0ZSIsInR5cCI6IkJlYXJlciIsImF6cCI6ImJicC1uZXh1cy1zdGFnaW5nIiwiYXV0aF90aW1lIjoxNTQzNDgwNDY1LCJzZXNzaW9uX3N0YXRlIjoiNzY5ZWMxMzEtMmQ0NC00ZWVjLWFlMWItNjJlOGZkMWYzYzNmIiwiYWNyIjoiMSIsImFsbG93ZWQtb3JpZ2lucyI6WyIvKiJdLCJyZXNvdXJjZV9hY2Nlc3MiOnt9LCJzY29wZSI6Im9wZW5pZCBuZXh1cyIsIm5hbWUiOiJCZW5vw650IEplYW4tQWxiZXJ0IENvc3RlIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiYmNvc3RlIiwiZ2l2ZW5fbmFtZSI6IkJlbm_DrnQgSmVhbi1BbGJlcnQiLCJmYW1pbHlfbmFtZSI6IkNvc3RlIiwiZW1haWwiOiJiZW5vaXQuY29zdGVAZXBmbC5jaCJ9.eAmll8Ijs0TIoOMe2IgNFL0n1dht4W3gqfqsSJkmf2pxd_di07caoHQTSo2DNCr6i3tBM-OB5wrYjYiQn5peTC-zT0drN8MYNXsYSLZAYz_pdqrM4pkb096PdyuggvdfR0FasSkP-_OmxkUjg4YFz2bwNyrm-duTyZGHcPVQPBqj4qxe5oghW24MmJzivQrORK55NqXQrH5qmCC8NHMIJrwmE8eNnzlMYOm0OJQpho0_h_J23oDry8M-QP8-B1EccTZ_LRfEbY6kcaW7fjvj8xWF8WEYN_C3Hs-nuHrrqoJe82gVzoCMfhHLrgNbHNW3sq_20wpycrDlTLQqMnWRrg"

set -x NEXUS_ORG "thalamusproject"
set -x NEXUS_BASE https://bbp-nexus.epfl.ch/staging/v0
set -x LD_LIBRARY_PATH $LD_LIBRARY_PATH /home/bcoste/workspace/morphology/io/build/src/

set -l default_gpfs_command "sshfs bbpv1.epfl.ch:/gpfs /gpfs -o reconnect"
if not test -d /gpfs/bbp.cscs.ch/project/
    echo "gpfs is not mounted yet"
    echo "Mounting gpfs ..."
    if type -q gpfs
        echo "Use 'gpfs' command"
        gpfs
    else
        echo "No gpfs prefered command. Use:"
        echo $default_gpfs_command
        eval $default_gpfs_command
    end
end

alias r='cd /gpfs/bbp.cscs.ch/project/proj55/bcoste/'
