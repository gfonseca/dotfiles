#!/bin/bash

if command -v tmux>/dev/null; then
  [ -z $TMUX ] && exec tmux
fi

# Bootstrap script to load environment variables from files in $SCRIPTS_PATH/scripts/
# Remove init.sh from initial load (EVADES INFINITE RECURSION)
local INIT_SCRIPT="init.sh"
export SCRIPTS_PATH="$DOTFILES_PATH/scripts"
for file in $SCRIPTS_PATH/*.sh; do
    
    # (EVADES INFINITE RECURSION)
    if [ "$(basename -- "$file")" = $INIT_SCRIPT ]; then
        continue
    fi
    
    if [ -f "$file" ]; then
        source "$file"
    fi
done