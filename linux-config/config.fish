. $HOME/.spacemacs.d/linux-config/aliases.fish

# alias dvorak='setxkbmap -layout us -variant dvp'


switch (uname)
    case Darwin
        set -x PATH /Applications/Emacs.app/Contents/MacOS/ $PATH
end


# set -x PYSPARK_PYTHON /home/bcoste/.virtualenvs/cdp/bin/python
set -x EDITOR vim
set -x CC clang
set -x CXX clang

if test -e ~/.credentials.fish
    . ~/.credentials.fish
end


alias ca 'code-assist'

source /home/bcoste/workspace/cdp-cli/scripts/cdissue.fish

# vf activate env
#gsettings set org.freedesktop.ibus.panel.emoji hotkey "[]"
# cd energy-cost
