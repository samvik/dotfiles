HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt APPEND_HISTORY BEEP EXTENDEDGLOB
setopt INC_APPEND_HISTORY
bindkey -e

zstyle :compinstall filename '/home/netbear/.zshrc'
autoload -Uz compinit
compinit

# Menu select
zstyle ':completion:*' menu select

# Syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# For a nice prompt, change prompt with the promt command. (ptomt -l, to show all available)
autoload -Uz promptinit
promptinit
prompt redhat

# Dir stack (cd -3, dirs -v)
DIRSTACKFILE="$HOME/.cache/zsh/dirs"
if [[ -f $DIRSTACKFILE ]] && [[ $#dirstack -eq 0 ]]; then
  dirstack=( ${(f)"$(< $DIRSTACKFILE)"} )
  [[ -d $dirstack[1] ]] && cd $dirstack[1]
fi
chpwd() {
  print -l $PWD ${(u)dirstack} >$DIRSTACKFILE
}

DIRSTACKSIZE=20

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS

## This reverts the +/- operators.
setopt PUSHD_MINUS


zstyle ':completion:*' rehash true

bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[3;5~" delete-char

for file in ~/.zshrc.d/*.zsh; do
  source "$file"
done
