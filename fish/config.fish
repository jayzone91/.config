if status is-interactive
  # Commands to run in interactive sessions can go here
  nvm use lts
  brew update
  brew upgrade
  clear
  pwd
  exa -l -g --icons --color auto
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

function convertImages -d "Converts all Images in a given Folder into WebP Format"
  set VORHER (pwd)
  cd $argv
  for f in *
    set EXTENSION (path extension $f)
    set BASENAME (path change-extension "" $f)
    if string match -rq '.jpg|.jpeg|.png|.tif|.tiff|.jpeg' "$EXTENSION"
      cwebp -mt -af -progress "$f" -o "$BASENAME".webp
    end
  end
  cd $VORHER
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

