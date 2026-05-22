#!/usr/bin/env bash
[ -z "$TMUX_PANE" ] && exit 0

PANE="$TMUX_PANE"
WINDOW=$(tmux display-message -p -t "$PANE" '#{window_id}' 2>/dev/null)
[ -z "$WINDOW" ] && exit 0

# Título do pane: laranja + ⚡ piscando
tmux set-option -pt "$PANE" pane-border-format "#[bg=#f5a623 fg=#000000 bold blink] ⚡ #{?#{!=:#{pane_title},},#{pane_title},#{pane_current_command}} "
tmux set-option -pt "$PANE" @claude_alert 1

# Window na status bar: window-status-style por window (opção real de window scope)
tmux set-option -wt "$WINDOW" window-status-style 'bg=#f5a623,fg=#000000,bold,blink'

tmux refresh-client
