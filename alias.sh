#!/bin/sh 

unalias -a

#GENERAL
alias ls="lsd"
alias ll="lsd -halt"
alias kgen="ssh-keygen -t ed25519"

#ZSH
alias zshconfig="code $HOME/.zshrc"
alias szsh="source $HOME/.zshrc"

## K8S
if command -v kubectl > /dev/null 2>&1; then
    kns () {
        export NAMES_SPACE=$1
    }
    
    source <(kubectl completion zsh)
    alias k='kubectl -n $NAMES_SPACE'
    alias kg='kubectl get -n $NAMES_SPACE'
    alias ka='kubectl apply -n $NAMES_SPACE'
    alias kl='kubectl logs -n $NAMES_SPACE'
fi

#GIT
if command -v git > /dev/null 2>&1; then
    alias gs='git status'
    alias gl='git log'
    alias gs='git push'
    alias gc='git commit'
fi

#DOCKER
if command -v docker > /dev/null 2>&1; then
    alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'
    alias dcu='docker-compose up -d'
    alias dcs='docker-compose stop'
    alias dcb='docker-compose build'
    alias dcub='docker-compose up -d --build'
    alias dcr='docker-compose restart'
    alias dcd='docker-compose down'
    alias dcl='docker-compose logs -f'
fi

#PACKAGE MANAGERS
if command -v brew > /dev/null 2>&1; then
    brewf() {
        brew search $1
    }

    brewi () {
        brew info $1
    }

    alias brewc='brew cleanup'
    alias update='brew update && brew upgrade && brew cleanup'
fi

if command -v apt-get > /dev/null 2>&1; then
    aptf() {
        apt-cache search $1
    }

    apti () {
        apt-cache show $1
    }

    alias aptc='sudo apt-get autoremove && sudo apt-get autoclean'
    alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove && sudo apt-get autoclean'
fi

alias shortk='grep -E "^\s*alias|^.*\(\)" $HOME/.config/myenv/alias.sh'