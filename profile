### path manipulations
[ -d /usr/local/bin ] && export PATH="/usr/local/bin:$PATH"
[ -d /usr/local/sbin ] && export PATH="/usr/local/sbin:$PATH"

[ -d /usr/local/mysql/bin ] && export PATH="$PATH:/usr/local/mysql/bin"


# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep="grep --color"
alias e='exit'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi='vim'
alias vib='sudo vim ~/.bashrc'
alias sb='source ~/.bashrc'
alias mongop='mongod --fork --logpath=/var/log/mongodb/mongodb.log'
export EDITOR=vim

# and this is where i set up tab completion for python
[ -f ~/.pythonrc ] && export PYTHONSTARTUP="$HOME/.pythonrc"

# and git tab completion
[ -f "$HOME/bin/home_files/git-completion.bash" ] && \
    which git &>/dev/null && \
        source "$HOME/bin/home_files/git-completion.bash"

# and the npm tab completion
[ -f "$HOME/bin/home_files/npm-completion.bash" ] && \
    which npm &>/dev/null && \
    source "$HOME/bin/home_files/npm-completion.bash"


# node version manger (nvm)
NVM_DIR=~/.nvm
[ -d $NVM_DIR ] && source $NVM_DIR/nvm.sh
[[ -r $NVM_DIR/bash_completion ]] && . $NVM_DIR/bash_completion
nvm use default


eval `ssh-agent -s`
[ -f ~/.ssh/id_rsa ] && ssh-add ~/.ssh/id_rsa
export NODE_PATH=/usr/lib/nodejs:/usr/lib/node_modules:/usr/share/javascript:/home/param/.nvm/versions/node/v0.12.2/lib/node_modules

