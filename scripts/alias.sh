#!/bin/sh 

unalias -a

#> -- DOTFILES --
dotfiles-sync () { #> dotfiles-sync: commit and push all changers in dotfiles
    (
        cd $DOTFILES_PATH
        git add .
        git commit -m "$1"
        git push origin master
    )
}

#> -------------
#> -- GENERAL --
alias ls="lsd" #> lsd: list folder content
alias ll="lsd -halt" #> ll: list folder human readable
alias kgen="ssh-keygen -t ed25519" #> kgen: generate ssh key pair 
#>  --------
#> -- ZSH --
alias zshconfig="code $HOME/.zshrc" #> zshconfig: open zsh config file
alias szsh="source $HOME/.zshrc" #> szsh: source zsh config file
#>  --------
#> -- K8S --
if command -v kubectl > /dev/null 2>&1; then
    kns () { #> kns: kubectl namespace switch
        export NAMES_SPACE=$1
    }
    
    source <(kubectl completion zsh)
    alias k='kubectl -n $NAMES_SPACE' #> k: kubectl
    alias kg='kubectl get -n $NAMES_SPACE' #> kg: kubectl get
    alias ka='kubectl apply -n $NAMES_SPACE' #> ka: kubectl apply
    alias kl='kubectl logs -n $NAMES_SPACE' #> kl: kubectl logs
fi
#>  --------
#> -- GIT --
if command -v git > /dev/null 2>&1; then
    alias gs='git status' #> gs: git status
    alias gl='git log' #> gl: git log
    alias gs='git push' #> gs: git push
    alias gc='git commit' #> gc: git commit
fi

#>  -----------
#> -- DOCKER --
if command -v docker > /dev/null 2>&1; then
    alias dps='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"' #> dps: docker ps
    alias dcu='docker compose up -d' #> dcu: docker-compose up
    alias dcs='docker compose stop' #> dcs: docker-compose stop
    alias dcb='docker compose build' #> dcb: docker-compose build
    alias dcub='docker compose up -d --build' #> dcub: docker-compose up --build
    alias dcr='docker compose restart' #> dcr: docker-compose restart
    alias dcd='docker compose down' #> dcd: docker-compose down
    alias dcl='docker compose logs -f' #> dcl: docker-compose logs
    
    _list_containers () {
        docker ps --format "table {{.Names}}"
    }

    dca() { #> dca: docker-compose exec
        docker exec -it $1 bash
    }
    complete -o nospace -F _list_containers dca
fi

#>  ----------------------
#>  -- PACKAGE MANAGERS --
if command -v brew > /dev/null 2>&1; then
    brewf() { #> brewf: brew search
        brew search $1
    }

    brewi () { #> brewi: brew install
        brew install $1
    }

    brewn () { #> brewi: brew info
        brew info $1
    }

    alias brewc='brew cleanup' #> brewc: brew cleanup
    alias update='brew update && brew upgrade && brew cleanup' #> update: brew update && brew upgrade && brew cleanup
fi

if command -v apt-get > /dev/null 2>&1; then
    aptf() { #> aptf: apt-cache search
        apt-cache search $1
    }

    apti () { #> apti: apt-cache show
        apt-cache show $1
    }

    alias aptc='sudo apt-get autoremove && sudo apt-get autoclean' #> aptc: apt-get autoremove && apt-get autoclean
    alias update='sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove && sudo apt-get autoclean' #> update: apt-get update && apt-get upgrade && apt-get autoremove && apt-get autoclean
fi

alias shortk='grep -E "#>" $SCRIPTS_PATH/alias.sh | awk -F"#>" "{ sub(/^> /, \"\", \$2); print \$2 }" | sed "s/^[ \t]*//;s/[ \t]*$//"' #> shortk: show aliases
