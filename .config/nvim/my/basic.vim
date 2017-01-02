"" --------------------------------------------------
"" いろいろ
"" --------------------------------------------------

set title             " タイトルを変更する
set ruler cursorline  " ルーラー表示
set showmode          " モード表示
set infercase         " 補完の際の大文字小文字の区別しない
set hidden            " 複数ファイルの編集を可能にする
set virtualedit=block " 矩形選択で文字が無くても右へ進めるようにする
set noswapfile

"" --------------------------------------------------
"" バックアップの設定
"" --------------------------------------------------

set undofile                       " vimを終了しても、undoの履歴を保持する
set undodir=$HOME/.cache/nvim/undo
set nobackup                       " バックアップを作成しない (hoge.txt~)

set history=100
set viminfo='100,<100,s10

set sessionoptions-=options

"" --------------------------------------------------
"" インデントの設定
"" --------------------------------------------------

set tabstop=2     " <Tab>s are shown with this num of <Space>s
set softtabstop=2 " Use this num of spaces as <Tab> on insert and delete
set shiftwidth=2  " Use this num of spaces for auto indent
set expandtab     " Always use <Tab> for indent and insert
set smarttab      " Use shiftwidth on beginning of line when <Tab> key
set smartindent   " Auto indent for C-like code with '{...}' blocks
set cindent       " Use same indent level on next line
set shiftround    " インデントを `shiftwidth` の値の倍数に丸める
set modeline      " ページ先頭のモードラインを有効にする

"" --------------------------------------------------
"" Editing, Search
"" --------------------------------------------------

if has('nvim')
  set clipboard+=unnamedplus
  if has('mouse')
    set mouse=
  endif
else
  set laststatus=2
  set wildmenu
  set clipboard=unnamed,autoselect
  set backspace=indent,eol,start " <BACKSPACE>で1つ上の行にいける
endif

set textwidth=0                 " 勝手に改行が入らないようにする
set whichwrap=b,s,h,l,<,>,[,],~ " 行頭や行末をまたいでも移動できるようにする

set noeb vb t_vb= " 音鳴らさない
set scrolloff=1   " show N more next line when scrolling

set incsearch  " Use 'incremental search'
set hlsearch   " Highlight search result
set ignorecase " Ignore case when searching
set smartcase  " Do not ignorecase if keyword contains uppercase

"" --------------------------------------------------
"" Status Line, Command Line
"" --------------------------------------------------

"" status line and line number
set number            " Show number of line on left
set numberwidth=5
set noshowcmd         " Always display the statusline in all windows
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
""set list listchars=tab:»-,eol:$,extends:»,precedes:«,nbsp:%


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
