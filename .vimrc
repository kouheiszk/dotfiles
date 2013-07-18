"" reset global autocmd
autocmd!

let mapleader = " "

source $HOME/.vim/my/neobundle.vim
source $HOME/.vim/my/basic.vim
source $HOME/.vim/my/template.vim
source $HOME/.vim/my/keybind.vim

if filereadable(expand('~/.vimrc.local'))
    source $HOME/.vimrc.local
end
