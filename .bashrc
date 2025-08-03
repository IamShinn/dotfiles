#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases
alias la='ls -A'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
ls --color=al > /dev/null 2>&1 && alias ls='ls -F --color=al' || alias ls='ls -G'
alias :q='exit'
alias :w="echo ':)'"

# startup
fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f bud-frogs -ny
PS1='\[\e[32m\][\u\[\e[0m\] \[\e[97m\]\W\[\e[32m\]]\[\e[0m\]\$ '
PS2="\[${yellow}\]>  \[${reset}\]";

#defaults
export EDITOR=vim
export TERM=ghostty

# coloroizer
GRC_ALIASES=true
[[ -s "/etc/profile.d/grc.sh" ]] && source /etc/grc.sh
