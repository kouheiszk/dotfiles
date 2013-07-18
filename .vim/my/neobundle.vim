set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'Shougo/neobundle.vim'

NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Lokaltog/vim-powerline'

NeoBundle 'Shougo/vimproc', {
    \'build' : {
        \   'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
        \   'cygwin' : 'make -f make_cygwin.mak',
        \   'mac' : 'make -f make_mac.mak',
        \   'unix' : 'make -f make_unix.mak',
    \},
\ }
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'

NeoBundle 'honza/vim-snippets'

NeoBundleCheck
