# dotfiles
dotfiles for bash, vim, git, etc.

## Installation

1. clone repository into home directory

2. run `./install.sh`

### Further instructions for vim
For the `.vimrc` to work properly, you have to first install vim-plug. For unix-type systems you can run following command:
    
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        
When installed, open vim and type `:PlugInstall` to install the plugins specified in the .vimrc

You can find further informations about vim-plug here: https://github.com/junegunn/vim-plug
