alias ls='ls --show-control-chars'
alias dir='ls --show-control-chars'
alias ll='ls -al --color=auto'
alias cls='clear'
alias vi='vim'
#alias ssh=~/ssh-change-prompt.sh

source ~/.bash/git-prompt
PS1="[\W\[\033[32m\]\$(parse_git_branch_or_tag)\[\033[0m\]] "
source ~/.bash/git-unyou
