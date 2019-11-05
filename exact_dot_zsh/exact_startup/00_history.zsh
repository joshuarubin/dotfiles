# The file to save the history in.
[ -z "$HISTFILE" ] && HISTFILE="${ZDOTDIR:-${HOME}}/.zhistory"

# The maximum number of events stored in the internal history list and in the history file.
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history          # share command history data

alias history-stat="fc -ln 0 | awk '{print \$1}' | sort | uniq -c | sort -nr | head"
