#!/bin/bash

if [[ -o interactive ]] && [[ -t 0 ]] && command -v tmux>/dev/null; then
  [ -z $TMUX ] && exec tmux new-session -A -s main
fi

# Bootstrap ~/.tmux.conf to source dotfiles base config
if [ ! -f "$HOME/.tmux.conf" ] || ! grep -q "dotfiles/tmux/tmux.conf" "$HOME/.tmux.conf" 2>/dev/null; then
  printf 'source ~/.config/dotfiles/tmux/tmux.conf\n\n# machine-specific overrides below\n' > "$HOME/.tmux.conf"
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