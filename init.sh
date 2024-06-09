#!/bin/bash

# Bootstrap script to load environment variables from files in ~/.config/myenv


# Remove init.sh from initial load (EVADES INFINITE RECURSION)
local INIT_SCRIPT="init.sh"
for file in $MYENV_PATH/*; do
    
    # (EVADES INFINITE RECURSION)
    if [ "$(basename -- "$file")" = $INIT_SCRIPT ]; then
        continue
    fi
    
    if [ -f "$file" ]; then
        source "$file"
    fi
done