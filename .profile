test -r /sw/bin/init.sh && . /sw/bin/init.sh

PATH=/android-sdk-mac_x86/tools:$PATH; export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Set default editor to vim
VISUAL=vim
export VISUAL
EDITOR=vim
export EDITOR

# adding support for git tab completion
if [ -f /sw/etc/bash_completition.d/git-completion.bash ]; then
. /sw/etc//bash_completion.d/git-completion.bash
fi

#Git Tab completion
source ~/git-completion.bash

# Start IRB in simple prompt without ruby version number
alias irb='irb --simple-prompt' 

#Colorize
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#RVM add to path
[[ -s "/Users/toucannyc/.rvm/scripts/rvm" ]] && source "/Users/toucannyc/.rvm/scripts/rvm"

alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias gs="git status"

# mkdir and cd into it
function mkcd() { mkdir $1; cd $1; }
alias mc="mkcd"

#ls aliases
alias ls="ls -F"
alias l="ls"
alias la="ls -AF"
alias a="la"
alias lo="ls -AF1"
alias ll="ls -AFhl"

# homeconfig management
# http://sursolid.com/managing-home-dotfiles-with-git-and-github
alias homeconfig='git --git-dir=$HOME/.homeconfig.git/ --work-tree=$HOME'

# https://github.com/danharper/Jumplist
source ~/.jumplist-driver
 #fuction _jumpcompletetion() {
 	#local curw
 	#COMPREPLY=()
 	#curw=${COMP_WORDS[COMP_CWORD]}
 	#COMPREPLY=($(compgen -W 'jump list | awk '/^\w+\S/gm { print $1 }' | tr '\n' ' '' -- $curw))
 	#return 0
 #}
function j() {
	if [ $# -eq 0 ]; then
		jump list
	else
		jump $@
	fi
}
# complete -F _jumpcompletetion -o bookmarknames 'jump list'

# Vi mode in Terminal line editing
# set -o vi

# http://vvv.tobiassjosten.net/bash/dynamic-prompt-with-git-and-ansi-colors
# Modified version of colored git prompt
# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
			  c_reset='\[\e[0m\]'
			  c_user='\[\033[1;33m\]'
			  c_path='\[\e[0;33m\]'
			  c_git_clean='\[\e[0;36m\]'
			  c_git_dirty='\[\e[0;35m\]'
			  c_host=$c_user
	else
	c_reset=
	c_user=
	c_path=
	c_git_clean=
	c_git_dirty=
	c_host=
fi

# Function to assemble the Git part of our prompt.
git_prompt ()
{
	if ! git rev-parse --git-dir > /dev/null 2>&1; then
		return 0
	fi
	git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
	if git diff --quiet 2>/dev/null >&2; then
		git_color="$c_git_clean"
	else
		git_color="$c_git_dirty"
	fi

	echo " [$git_color$git_branch${c_reset}]"
}
#remote_host_colored () {
	#if \h != "lgblackmb"; then
	#	c_host='\[\e[0;32m\]'	
	#fi
#}

# Thy holy prompt.
PROMPT_COMMAND='PS1="${c_user}\u${c_reset}@${c_reset}:${c_path}\W${c_reset}$(git_prompt)\$ "'
