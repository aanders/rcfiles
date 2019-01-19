#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load color definitions
[[ -f ~/.bash_colors ]] && source ~/.bash_colors

# Set a prompt

# Load git-detecting functions for use in prompt
[[ -f ~/.bash/git_prompt ]] && source ~/.bash/git_prompt
# Get the exit status of the last command if non-zero
function last_rc() {
    if [ "$?" -eq 0 ]; then
        echo ""
    else
        echo "$? "
    fi
}
PS1="\[${txtred}\]\$(last_rc)\[${bldylw}\]\u\[${txtylw}\] \W\[${txtcyn}\]\$(git_branch)\[${txtred}\]\$(git_dirty)\[${txtrst}\]\$ "

# Set colors and color support

alias ls='ls --color=auto'
# Further enhance ls color output
eval $(dircolors -b)

alias grep='grep --color=auto'

# If we are running in a pseudo terminal, and don't already have 256
# colors, we probably ought to have 256 color support (cross fingers)
if [[ $(tty) =~ pts && $(tput colors) == 8 ]] ; then
    TERM=xterm-256color
fi

# Disable terminal flow control
stty -ixon -ixoff

# Load bash completions
load_completion_src=/usr/share/bash-completion/bash_completion
[[ -f "$load_completion_src" ]] && source $load_completion_src

[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

[[ -f ~/.bash_env ]] && source ~/.bash_env
