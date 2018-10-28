# .bash_aliases

# Allow aliases to work with sudo.  The space at the end of sudo
# instructs bash to check the next command for aliases (?)
# https://wiki.archlinux.org/index.php/sudo#Passing_aliases
alias sudo='sudo '

# ls aliases
alias lh="ls -lh"
alias la="ls -lha"

# Safety aliases for file management
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
