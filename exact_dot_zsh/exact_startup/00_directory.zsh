# If a command is issued that can't be executed as a normal command, and the
# command is the name of a directory, perform the cd command to that directory.
setopt auto_cd

# Make cd push the old directory onto the directory stack.
setopt auto_pushd

# Don't push multiple copies of the same directory onto the directory stack.
setopt pushd_ignore_dups

# Do not print the directory stack after pushd or popd.
setopt pushd_silent

# Have pushd with no arguments act like `pushd $HOME'.
setopt pushd_to_home

# Treat the `#', `~' and `^' characters as part of patterns for filename
# generation, etc.
# (An initial unquoted `~' always produces named directory expansion.)
setopt extended_glob

# Perform implicit tees or cats when multiple redirections are attempted
setopt multios

# Disallow `>' redirection to truncate existing files.
# Use `>!' or `>|' to truncate a file.
setopt no_clobber
