#!/bin/sh

export CODE_HOME="$HOME/code"

codeh () {
    export CODE_HOME="$HOME/$1"
}

cdc () {
    if [ -z "$1" ]; then
        cd $CODE_HOME
    else
        cd $CODE_HOME/$1
    fi
}

_list_projects () {
    local cur
    cur=${COMP_WORDS[COMP_CWORD]}
    COMPREPLY=( $(cd $CODE_HOME && compgen -d -- $cur) )
}

copen () {
    code $CODE_HOME/$1
}

complete -o nospace -F _list_projects copen
complete -o nospace -F _list_projects cdc
