set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Lokaltog/powerline', {'rtp' : 'powerline/bindings/vim'}
NeoBundle 'Shougo/vimproc', {
    \'build' : {
        \   'windows' : 'echo "Sorry, cannot update vimproc binary file in Windows."',
        \   'cygwin' : 'make -f make_cygwin.mak',
        \   'mac' : 'make -f make_mac.mak',
        \   'unix' : 'make -f make_unix.mak',
    \},
\ }

NeoBundle 'Shougo/vimshell'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'kmnk/vim-unite-giti'
NeoBundle 'tacroe/unite-mark'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'honza/vim-snippets'
NeoBundle 'godlygeek/tabular'
NeoBundle 't9md/vim-textmanip'
NeoBundle 'YankRing.vim'
NeoBundle 'kana/vim-smartinput'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'haruyama/vim-matchopen'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'dannyob/quickfixstatus'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'surround.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'thinca/vim-ref'
NeoBundle 'thinca/vim-qfreplace'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-template'
NeoBundle 't9md/vim-quickhl'
NeoBundle 'vim-jp/vital.vim'

NeoBundleLazy 'html5.vim', {
      \ "autoload": {
      \   "filetypes": ["html"],
      \ }}
NeoBundleLazy 'cakebaker/scss-syntax.vim', {
      \ "autoload": {
      \   "filetypes": ["scss"],
      \ }}
NeoBundleLazy 'Simple-Javascript-Indenter', {
      \ "autoload": {
      \   "filetypes": ["javascript"],
      \ }}
NeoBundle 'walm/jshint.vim', {
      \ "autoload": {
      \   "filetypes": ["javascript"],
      \ }}
NeoBundle 'jelera/vim-javascript-syntax', {
      \ "autoload": {
      \   "filetypes": ["javascript"],
      \ }}
NeoBundleLazy 'nakatakeshi/jump2pm.vim.git', {
      \ "autoload": {
      \   "filetypes": ["perl"],
      \ }}
NeoBundleLazy 'vim-perl/vim-perl', {
      \ "autoload": {
      \   "filetypes": ["perl"],
      \ }}
NeoBundle 'shawncplus/php.vim', {
      \ "autoload": {
      \   "filetypes": ["php"],
      \ }}
NeoBundle 'arnaud-lb/vim-php-namespace', {
      \ "autoload": {
      \   "filetypes": ["php"],
      \ }}
NeoBundleLazy 'haruyama/scheme.vim', {
      \ "autoload": {
      \   "filetypes": ["scheme"],
      \ }}
NeoBundleLazy 'violetyk/cake.vim', {
      \ "autoload": {
      \   "filetypes": ["php"],
      \ }}
NeoBundleLazy "vim-pandoc/vim-pandoc", {
      \ "autoload": {
      \   "filetypes": ["text", "pandoc", "markdown", "rst", "textile"],
      \ }}

NeoBundleCheck
filetype plugin indent on
