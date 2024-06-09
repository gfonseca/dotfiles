#!/bin/sh

plugins=(git zsh-syntax-highlighting)

if [ ! -d ~/.oh-my-zsh/custom/themes/powerlevel9k ]; then
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi

ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=trues
POWERLEVEL9K_RPROMPT_ON_NEWLINE=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon time user dir newline vcs root_indicator)
POWERLEVEL9K_COLOR_SCHEME='light'

# colors
POWERLEVEL9K_TIME_BACKGROUND='blue'
POWERLEVEL9K_OS_ICON_BACKGROUND='magenta'
POWERLEVEL9K_DIR_HOME_BACKGROUND='darkseagreen'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='indianred'


source  ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme