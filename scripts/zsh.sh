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
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon time user dir newline vcs virtualenv)
POWERLEVEL9K_COLOR_SCHEME='light'

# colors

POWERLEVEL9K_OS_ICON_BACKGROUND='grey23'

POWERLEVEL9K_TIME_BACKGROUND='darkorange3'
POWERLEVEL9K_TIME_FOREGROUND='black'


POWERLEVEL9K_USER_DEFAULT_BACKGROUND='darkorange'
POWERLEVEL9K_USER_DEFAULT_FOREGROUND='black'

POWERLEVEL9K_DIR_HOME_BACKGROUND='mediumpurple4'
POWERLEVEL9K_DIR_HOME_FOREGROUND='white'

POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='orange1'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='black'

POWERLEVEL9K_VCS_CLEAN_BACKGROUND='darkolivegreen3'
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='black'

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='darkgoldenrod'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='darkmagenta'

source  ~/.oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme