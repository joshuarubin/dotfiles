# Enable command correction prompts
setopt CORRECT

# Allow brace character class list expansion.
setopt BRACE_CCL

# Combine zero-length punctuation characters (accents) with the base character.
setopt COMBINING_CHARS

# Allow 'Henry''s Garage' instead of 'Henry'\''s Garage'.
setopt RC_QUOTES

# Report the status of background and suspended jobs before exiting a shell with job control.
setopt CHECK_JOBS

# Beep when accessing non-existent history.
setopt HIST_BEEP

# Remove superfluous blanks from each command line being added to the history list.
setopt HIST_REDUCE_BLANKS

# Complete from both ends of a word.
setopt COMPLETE_IN_WORD

# If completed parameter is a directory, add a trailing slash.
setopt AUTO_PARAM_SLASH

# Don't beep on an ambiguous completion
setopt NO_LIST_BEEP

# Disable start/stop characters in shell editor.
setopt NO_FLOW_CONTROL

# Beep on error in line editor.
setopt BEEP

# Attempt to preserve a partial line (i.e. a line that did not end with a newline) that would otherwise be covered up by the command prompt due to the PROMPT_CR option.
setopt PROMPT_SP
