"" --------------------------------------------------
"" 一般設定
"" --------------------------------------------------

set nocompatible
set title
set autoindent
set ruler cursorline showcmd showmode
set incsearch
set ignorecase smartcase
set expandtab smarttab
set number modeline shiftround infercase hidden
set noerrorbells
set hlsearch
set backup
set history=100
set virtualedit=block
retab

"" --------------------------------------------------
"" バックアップの設定
"" --------------------------------------------------

set undofile                " Save undo history to file
set undodir=$HOME/.vim/undo " Specify where to save
set nobackup                " Don't create backup files (foobar~)

" reffer: http://vimwiki.net/?'viminfo'
set history=100
set viminfo='100,<100,s10

"" --------------------------------------------------
"" インデントの設定
"" --------------------------------------------------

set tabstop=4     " <Tab>s are shown with this num of <Space>s
set softtabstop=4 " Use this num of spaces as <Tab> on insert and delete
set shiftwidth=4  " Use this num of spaces for auto indent
set expandtab     " Always use <Tab> for indent and insert
set smarttab      " Use shiftwidth on beginning of line when <Tab> key
set autoindent    " Use same indent level on next line
set smartindent   " Auto indent for C-like code with '{...}' blocks
set shiftround    " Round indent when < or > is used

set bs=2
set showtabline=1
set numberwidth=5
set cmdheight=1
set textwidth=0
set wildmenu wildmode=list:longest
set foldmethod=indent
set completeopt& completeopt+=longest
set backspace=indent,start,eol
set laststatus=2
set matchpairs& matchpairs+=<:>
set nrformats-=octal
set list listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:%
set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp,sjis
set fileformats=unix,dos,mac

"" --------------------------------------------------
"" カラースキーマ
"" --------------------------------------------------

syntax enable
syntax on
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

"" --------------------------------------------------
"" Power Line
"" --------------------------------------------------

let g:Powerline_symbols = 'fancy'
