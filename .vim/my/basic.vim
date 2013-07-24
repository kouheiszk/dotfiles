let mapleader = " "

"" --------------------------------------------------
"" 一般設定
"" --------------------------------------------------

set nocompatible
set title
set ruler cursorline showmode
set modeline shiftround infercase hidden
set virtualedit=block
retab

"" --------------------------------------------------
"" バックアップの設定(Undo, Backup, History, Session)
"" --------------------------------------------------

set undofile                " Save undo history to file
set undodir=$HOME/.vim/undo " Specify where to save
set nobackup                " Don't create backup files (foobar~)

" reffer: http://vimwiki.net/?'viminfo'
set history=100
set viminfo='100,<100,s10

autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif |
  \ execute "normal! zv" | " open fold under cursor
  \ execute "normal! zz"   " Move current line on center of window

set sessionoptions-=options

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

"" --------------------------------------------------
"" Editing, Search
"" --------------------------------------------------

set bs=2                       " 挿入モード以外でもbackspaceで削除できる
set backspace=indent,eol,start " go to previous line with backspace
set textwidth=0                " don't insert break automatically
set whichwrap=b,s,<,>,[,]

""set foldmethod=marker " Use '{{{' and '}}}' for marker
""set foldmethod=indent
set foldlevelstart=0  " Start with all folds closed
set noeb vb t_vb=     " no beep
set scrolloff=1       " show N more next line when scrolling

"" Search
set incsearch         " Use 'incremental search'
set hlsearch          " Highlight search result
set ignorecase        " Ignore case when searching
set smartcase         " Do not ignorecase if keyword contains uppercase

"" --------------------------------------------------
"" Status Line, Command Line
"" --------------------------------------------------

"" status line and line number
set number            " Show number of line on left
set numberwidth=5
set showcmd           " Show what keys input for command, but too slow on terminal
set laststatus=2      " Always show statusline

"" command line
set cmdheight=2              " Set height of command line
set wildmode=list:longest    " command line completion order
set wildmenu                 " Enhanced completion
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.swp,*.swo " Don't use matched files for completion
set shortmess+=I

set completeopt& completeopt+=longest
set matchpairs& matchpairs+=<:>
set nrformats-=octal
"" set list listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:%

"" --------------------------------------------------
"" Language, Encoding
"" --------------------------------------------------

try
    :language en
catch
    :language C
endtry

set encoding=utf-8
set fileencodings=utf-8,euc-jp,cp932,iso-2022-jp,sjis
set fileformats=unix,dos,mac

"" --------------------------------------------------
"" カラースキーマ
"" --------------------------------------------------

syntax enable
syntax on
set background=dark
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
colorscheme solarized

"" --------------------------------------------------
"" Power Line
"" --------------------------------------------------

let g:Powerline_symbols = 'fancy'

