if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias vim="nvim"
alias ll="exa -l -g --icons"
alias lla="ll -a"
alias ls="ls --color"
alias c="clear;ls;pwd"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

