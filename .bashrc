#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export EDITOR='/usr/bin/vim'

alias ls='ls --color=auto'
alias lsa='ls -a --color=auto'


function shortwd() {
    num_dirs=3
    pwd_symbol="..."
    newPWD="${PWD/#$HOME/~}"
    if [ $(echo -n $newPWD | awk -F '/' '{print NF}') -gt $num_dirs ]
    then
        newPWD=$(echo -n $newPWD | awk -F '/' '{print $1 "/.../" $(NF-1) "/" $(NF)}')
    fi
    echo -n $newPWD
}

function parse_git_branch {
    if [[ -x /usr/bin/git ]]; then
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
    fi
}

PS1='\n'
PS1+='\[\033[36;1m\]╭────[ '
PS1+='\[\033[31;1m\]\u'
PS1+='\[\033[00m\]@'
PS1+='\[\033[34;1m\]\h'
PS1+='\[\033[36;1m\] ]────[ '
PS1+='\[\033[35;1m\]$(shortwd) '
PS1+='\[\033[32;1m\]$(parse_git_branch) ]'
PS1+='\[\033[36;1m\]>\n╰───[ '
PS1+='\[\033[32;1m\]$(date +%H:%M)'
PS1+='\[\033[36;1m\] ]'
PS1+='\[\033[00m\] $ '

