# The file to save the history in.
[ -z "$HISTFILE" ] && HISTFILE="${ZDOTDIR:-${HOME}}/.zhistory"

# The maximum number of events stored in the internal history list and in the history file.
HISTSIZE=50000
SAVEHIST=10000

# Perform textual history expansion, csh-style, treating the character `!'
# specially.
setopt bang_hist

# Save each command's beginning timestamp (in seconds since the epoch) and the
# duration (in seconds) to the history file.
setopt extended_history

# If a new command line being added to the history list duplicates an older one,
# the older command is removed from the list (even if it is not the previous
# event).
setopt hist_ignore_all_dups

# When writing out the history file, older commands that duplicate newer ones
# are omitted.
setopt hist_save_no_dups

# Do not enter command lines into the history list if they are duplicates of the
# previous event.
setopt hist_ignore_dups

# Remove  command  lines from the history list when the first character on the
# line is a space.
setopt hist_ignore_space

# This option both imports new commands from the history file, and also causes
# your typed commands to be appended to the history file.
setopt share_history

alias history-stat="fc -ln 0 | awk '{print \$1}' | sort | uniq -c | sort -nr | head"
