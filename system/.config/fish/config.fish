set -x PATH $HOME/.bin $HOME/.bin/scripts /usr/local/bin $PATH
set -x PATH /home/raawaa/.texlive2016/bin/x86_64-linux/ $PATH
# set -x MANPATH /home/raawaa/.texlive2016/texmf-dist/doc/man $MANPATH
set -x INFOPATH /home/raawaa/.texlive2016/texmf-dist/doc/info $INFOPATH

set -x LANG zh_CN.UTF-8
set -x TERM xterm-256color
set -x EDITOR nvim

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
# set -x COCOS_CONSOLE_ROOT /home/raawaa/Code/cocos2d-x-3.11.1/tools/cocos2d-console/bin
# set -x PATH $COCOS_CONSOLE_ROOT $PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
# set -x COCOS_X_ROOT /home/raawaa/Code
# set -x PATH $COCOS_X_ROOT $PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
# set -x COCOS_TEMPLATES_ROOT /home/raawaa/Code/cocos2d-x-3.11.1/templates
# set -x PATH $COCOS_TEMPLATES_ROOT $PATH


alias yd "youtube-dl --proxy localhost:8087 --no-check-certificate"
alias gst "git status"
alias gco "git checkout"
alias gl "git pull"
alias gp "git push"
alias gcm "git checkout master"
alias gaa "git add -A"
alias gc "git commit"
alias ec "emacsclient"

begin
    set --local AUTOJUMP_PATH /usr/share/autojump/autojump.fish
    if test -e $AUTOJUMP_PATH
        source $AUTOJUMP_PATH
    end
end

fish_vi_key_bindings
