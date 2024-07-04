. $HOME/.spacemacs.d/linux-config/aliases.fish

# alias dvorak='setxkbmap -layout us -variant dvp'


switch (uname)
    case Darwin
        set -x PATH /Applications/Emacs.app/Contents/MacOS/ $PATH
end


set -x EDITOR vim
set -x CC clang
set -x CXX clang

if test -e ~/.credentials.fish
    . ~/.credentials.fish
end

set -x CDPATH . $HOME/workspace/peachtree $HOME/workspace

vf activate env
#gsettings set org.freedesktop.ibus.panel.emoji hotkey "[]"
# cd energy-cost


set -x USE_PYGEOS 0
fish_add_path /home/bcoste/appz/pycharm-2023.2.5/bin
fish_add_path /home/bcoste/workspace/next-tag
export PGDATABASE=bcoste
