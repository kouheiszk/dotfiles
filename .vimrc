"" --------------------------------------------------
"" 一般設定
"" --------------------------------------------------

set nocompatible
set title
set autoindent
set ruler cursorline showcmd showmode incsearch ignorecase smartcase expandtab number modeline shiftround infercase hidden
set tabstop=4 softtabstop=4 bs=2 shiftwidth=4
set smarttab
retab
set hlsearch
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
set showtabline=1
set numberwidth=5
set backup
set history=100
set noswapfile
set showmatch
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set fileformats=unix,dos,mac
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,eucjp-ms,sjis
set mouse=a
set ttymouse=xterm
set t_Co=256
set laststatus=2
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない
set list
set listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:%
set wildmode=list:longest
set textwidth=0


"" --------------------------------------------------
"" Neo Bundle
"" --------------------------------------------------

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))

filetype plugin indent on
filetype indent on
syntax on

NeoBundle 'Shougo/vimproc'

"" --------------------------------------------------
"" カラースキーマ
"" --------------------------------------------------

NeoBundle 'altercation/vim-colors-solarized'
syntax enable
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

"" --------------------------------------------------
"" Vim Shell
"" --------------------------------------------------

NeoBundle 'Shougo/vimshell'
"" vimshellをCtrl-dで終了できるようにする
autocmd FileType vimshell inoremap 
    \ <buffer><silent><expr><C-d>
    \ vimshell#get_cur_text()=='' ? "\<Esc>\<Plug>(vimshell_exit)" : "\<Del>"

noremap <silent> ,ss :VimShell<CR>
autocmd FileType scheme nnoremap <silent> ,sg :VimShellInteractive gosh<CR><Esc><C-w>l
autocmd FileType scheme nnoremap <silent> <F5> <S-v>:VimShellSendString<CR>
autocmd FileType scheme inoremap <silent> <F5> <Esc><S-v>:VimShellSendString<CR>`>i
autocmd FileType scheme vnoremap <silent> <F5> :VimShellSendString<CR>

"" --------------------------------------------------
"" Neo Complete Cache (自動補完)
"" --------------------------------------------------
""
""NeoBundle 'Shougo/neocomplcache'
""
"""" 起動時に有効化
""let g:neocomplcache_enable_at_startup = 1
"""" 大文字が入力されるまで大文字小文字の区別を無視する
""let g:neocomplcache_enable_smart_case = 1
"""" アンダースコア区切りとキャメルケースの補完を有効化
""let g:neocomplcache_enable_underbar_completion = 1
""let g:neocomplcache_enable_camel_case_completion = 1
"""" シンタックスをキャッシュするときの最小文字長
""let g:neocomplcache_min_syntax_length = 3
""let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"""" 手動補完を実行できる最小文字数
""let g:neocomplcache_manual_completion_start_length = 0
"""" 自動的に保管ウィンドを開かない
""let g:neocomplcache_disable_auto_complete = 1
"""" 自動選択する
""let g:neocomplcache_enable_auto_select = 1
"""" キーワード
""if !exists('g:neocomplcache_keyword_patterns')
""let g:neocomplcache_keyword_patterns = {}
""endif
""let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
""let g:neocomplcache_ctags_arguments_list = {
""  \ 'perl' : '-R -h ".pm"'
""  \ }
""let g:neocomplcache_snippets_dir = "~/.vim/snippets"
""let g:neocomplcache_dictionary_filetype_lists = {
""  \ 'default' : '',
""  \ 'perl'    : $HOME . '/.vim/dict/perl.dict'
""  \ }" 
""
"""" スニペットを展開する。スニペットが関係しないところでは行末まで削除
""inoremap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
""snoremap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
"""" 前回行われた補完をキャンセルします
""inoremap <expr><C-g> neocomplcache#undo_completion()
""" 改行で補完ウィンドウを閉じる
""inoremap <expr> neocomplcache#smart_close_popup() : "\<CR>"
"""" tabで補完候補の選択を行う
""inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
""inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
"""" <C-h>や<BS>を押したときに確実にポップアップを削除します
""inoremap <expr> neocomplcache#smart_close_popup() : "\<C-h>"
"""" 現在選択している候補を確定します
""inoremap <expr> neocomplcache#close_popup() : "\<CR>"
"""" 現在選択している候補をキャンセルし、ポップアップを閉じます
""inoremap <expr><C-e> neocomplcache#cancel_popup()
"""" C-Spaceで補完する
""inoremap <Nul> <C-n>

"" --------------------------------------------------
"" Ctrl P
"" --------------------------------------------------
""
""NeoBundle 'kien/ctrlp.vim'
"""" let g:ctrlp_map = '<c-f>'
""let g:ctrlp_cmd = 'CtrlP'
"""" let g:ctrlp_use_migemo = 1 " 日本語ファイルにマッチしたくなったときは、migemoを入れる
""let g:ctrlp_clear_cache_on_exit = 0 " 終了時キャッシュをクリアしない
""let g:ctrlp_mruf_max = 500 " MRUの最大記録数
""let g:ctrlp_max_depth = 20
""let g:ctrlp_working_path_mode = 'ra'
""set wildignore+=*/tmp/*,*.so,*.swp,*.zip
""let g:ctrlp_custom_ignore = {
""  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
""  \ 'file': '\v\.(exe|so|dll)$',
""  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
""  \ }

"" --------------------------------------------------
"" Power Line
"" --------------------------------------------------

NeoBundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'

"""" --------------------------------------------------
"""" カッコを自動で閉じる
"""" --------------------------------------------------
""""
""""NeoBundle 'yuroyoro/vim-autoclose'
""
"""" --------------------------------------------------
"""" jとkの移動が加速
"""" --------------------------------------------------
""
""NeoBundle 'rhysd/accelerated-jk'
""nmap j <Plug>(accelerated_jk_gj)
""nmap k <Plug>(accelerated_jk_gk)
""
"""" --------------------------------------------------
"""" Scheme用
"""" --------------------------------------------------
""
""""NeoBundle 'slimv.vim'
"""" 春山さんのschemeの設定を使う
""NeoBundle 'haruyama/scheme.vim', {'autoload': {'filetypes':['scheme']}}
""autocmd FileType scheme :let is_gauche=1
""autocmd FileType scheme setlocal complete-=k
""autocmd FileType scheme setlocal complete+=k~/.gosh_completions
""
"""" --------------------------------------------------
"""" シンタックスハイライト
"""" --------------------------------------------------
""
""NeoBundle 'scrooloose/syntastic'
"""" エラー表示マークを変更
""let g:syntastic_enable_signs=1
""let g:syntastic_error_symbol='✗'
""let g:syntastic_style_error_symbol='✗'
""let g:syntastic_warning_symbol='⚠'
""let g:syntastic_style_warning_symbol='⚠'
""
"""" --------------------------------------------------
"""" ag
"""" --------------------------------------------------
""
""NeoBundle 'rking/ag.vim'

"" --------------------------------------------------
"" キーマップ
"" --------------------------------------------------
"" コマンド       ノーマル  挿入  コマンド ビジュアル
"" map/noremap        @       -       -        @
"" nmap/nnoremap      @       -       -        -
"" imap/inoremap      -       @       -        -
"" cmap/cnoremap      -       -       @        -
"" vmap/vnoremap      -       -       -        @
"" map!/noremap!      -       @       @        -
"" --------------------------------------------------

"" Ctrl-a Ctrl-eで移動できるようにする
function! MoveCursorToHome()
    let c = col(".")
    exec "normal ^"
    if col(".") == c
        exec "normal 0"
    endif
endfunction
inoremap <silent> <C-a> <Esc>:call MoveCursorToHome()<CR>i
inoremap <C-e> <End>
noremap <silent> <C-a> :call MoveCursorToHome()<CR>
noremap <C-e> <End>
xnoremap <silent> <C-a> :call MoveCursorToHome()<CR>
xnoremap <C-e> <End>
"" InsertモードでCtrlで移動可能に
inoremap <C-d> <Del>
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
nnoremap <C-h> <Left>
nnoremap <C-j> <Down>
nnoremap <C-k> <Up>
nnoremap <C-l> <Right>
"" コピー
xnoremap y y`>
"" 検索結果に移動したとき、その位置を画面の中央に
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
"" C-[でNormalモードに移行
inoremap <silent> <C-[> <Esc>
vnoremap <silent> <C-[> <Esc>
noremap ; :

"" --------------------------------------------------
"" Instration check
"" --------------------------------------------------

NeoBundleCheck
