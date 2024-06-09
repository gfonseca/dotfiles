#!/bin/sh

if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]; then
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi
source  ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=trues
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon context dir newline)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs)