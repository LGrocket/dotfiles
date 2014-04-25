test -r /sw/bin/init.sh && . /sw/bin/init.sh

PATH=/android-sdk-mac_x86/tools:$PATH; export PATH

# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
#Path for HomewBrew
PATH="/usr/local/bin:/usr/bin:${PATH}"
#PATH for NPM
PATH="/usr/local/share/npm/bin:${PATH}"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
export PATH
#PATH for Node.js
export NODE_PATH="/usr/local/lib/node"

# Set default editor to vim
#VISUAL='mvim -v'
#export VISUAL
#EDITOR='mvim -v'
#export EDITOR

# adding support for git tab completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
	. `brew --prefix`/etc/bash_completion
fi

# Start IRB in simple prompt without ruby version number
alias irb='irb --simple-prompt' 

# Use macvim for terminal vim
#alias vim="mvim -v"

#Colorize
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

#RVM add to path
[[ -s "/Users/toucannyc/.rvm/scripts/rvm" ]] && source "/Users/toucannyc/.rvm/scripts/rvm"

alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias gs="git status"
alias gc="git commit -am"

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

# Eclim daemon alias
alias eclimd="/Applications/eclipse/eclimd"

# UMass EdLab alias
alias edlab="ssh lgutterm@elnux1.cs.umass.edu"

#Bundler Binstubs alias
#http://robots.thoughtbot.com/post/15346721484/use-bundlers-binstubs
alias binstubs="bundle install --binstubs"

# homeconfig management
# http://sursolid.com/managing-home-dotfiles-with-git-and-github
alias dotfiles='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

# https://github.com/danharper/Jumplist
source ~/.jumplist-driver
function j() {
	if [ $# -eq 0 ]; then
		jump list
	else
		jump $@
	fi
}

# Vi mode in Terminal line editing
set -o vi

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

##
# Your previous /Users/toucannyc/.profile file was backed up as /Users/toucannyc/.profile.macports-saved_2012-05-10_at_11:58:58
##

# MacPorts Installer addition on 2012-05-10_at_11:58:58: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

