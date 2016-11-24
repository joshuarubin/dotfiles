#
# Executes commands at login pre-zshrc.
#

export ZSH=$HOME/.dotfiles/zsh

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export PAGER='less'

if (( $#commands[vim] )); then
  export EDITOR="vim"
  export VISUAL="vim"
fi

if (( $#commands[nvim] )); then
  export EDITOR="nvim"
  export VISUAL="nvim"
  export MANPAGER="nvim -c 'set ft=man' -"
fi

if [ -d "$HOME/.vim/plugged/vimpager" ]; then
  path[1,0]="$HOME/.vim/plugged/vimpager"
  export MANPATH="$MANPATH:$HOME/.vim/plugged/vimpager"
fi

if (( $#commands[vimpager] )); then
  export MANPAGER=vimpager

  export PAGER=vimpager
  alias less=$PAGER
  alias zless=$PAGER
fi

if (( $#commands[vimcat] )); then
  alias cat=vimcat
fi

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"
