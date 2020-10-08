# Quote pasted urls automatically, if the paste exactly starts with a url, eg no
# spaces or other characters precede it.
autoload -Uz bracketed-paste-url-magic && zle -N bracketed-paste bracketed-paste-url-magic

# This widget replaces the built-in self-insert to make it easier to type URLs
# as command line arguments. As you type, the input character is analyzed and,
# if it may need quoting, the current word is checked for a URI scheme. If one
# is found and the current word is not already in quotes, a backslash is
# inserted before the input character.
autoload -Uz url-quote-magic && zle -N self-insert url-quote-magic

# Treat single word simple commands without redirection as candidates for
# resumption of an existing job.
setopt auto_resume

# Allow comments starting with `#` even in interactive shells.
setopt interactive_comments

# Print job notifications in the long format by default.
setopt long_list_jobs

# Report the status of background jobs immediately, rather than waiting until
# just before printing a prompt.
setopt notify

# Prevent runing all background jobs at a lower priority.
setopt no_bg_nice
