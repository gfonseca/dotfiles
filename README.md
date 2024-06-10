# My Dot Files collection

My default config files for unix systems

# Installation
````sh
$ cd $HOME/.config/
$ git clone git@github.com:gfonseca/dotfiles.git
$ cat <<EOF | $HOME/.zshrc 
export DOTFILES_PATH=$HOME/.config/dotfiles
source $DOTFILES_PATH/scripts/init.sh
EOF

$ source $HOME/.zshrc
````