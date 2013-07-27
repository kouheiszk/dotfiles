"" reset global autocmd
autocmd!

source $HOME/.vim/my/neobundle.vim
source $HOME/.vim/my/basic.vim
source $HOME/.vim/my/misc.vim
source $HOME/.vim/my/tabline.vim
source $HOME/.vim/my/template.vim
source $HOME/.vim/my/tabular.vim
source $HOME/.vim/my/textmanip.vim
source $HOME/.vim/my/syntastic.vim
source $HOME/.vim/my/unite.vim
source $HOME/.vim/my/vimshell.vim
source $HOME/.vim/my/keybind.vim

if filereadable(expand('~/.vimrc.local'))
    source $HOME/.vimrc.local
end
