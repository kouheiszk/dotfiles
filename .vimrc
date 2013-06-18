"" --------------------------------------------------
"" 一般設定
"" --------------------------------------------------

"" ターミナルのタイトルを変更する
set title
"" インデント方式
set autoindent
set tabstop=4
set expandtab
set shiftwidth=4
set smarttab
retab
"" インクリメンタル検索
set incsearch
set hlsearch
"" 検索のループをさせない
set nowrapscan
"" 検索後Esc連打でハイライトを消す
set hlsearch
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
"" Tabによるインデント回避
set expandtab
"" カーソルのある行番号の表示
""set ruler
"" カーソル行をハイライト
""set cursorline
"" タブ系の設定
""set showtabline=2
"" 行番号表示
set number
"" バックアップとか自分でしろ
set nobackup
"" スワップファイル要らない
set noswapfile
"" 対応する括弧の表示
set showmatch
"" 折り返さない
""set nowrap
"" Backspaceで消せるようにする
set backspace=indent,eol,start
"" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
"" 改行コードの自動認識
set fileformats=unix,dos,mac
"" 文字コード指定
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,eucjp-ms,sjis
"" ターミナルでマウスを使用できるようにする
set mouse=a
set ttymouse=xterm
"" 256色ターミナル
set t_Co=256
"" ステータス行の表示
set laststatus=2
"" vi互換しない
set nocompatible
"" ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない
"" ファイルタイプの判別はしない
filetype off
"" 最後に編集した行へ飛ぶ
augroup vimrcEx
au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END
"" 不可視文字を表示
set list
set listchars=tab:»-,eol:↲,extends:»,precedes:«,nbsp:%
"" 全角スペースを表示
augroup highlightIdegraphicSpace
autocmd!
autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END
"" カーソルの形状
""let &t_SI = "\<Esc>]50;CursorShape=1\x7"
""let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"" --------------------------------------------------
"" Neo Bundle
"" --------------------------------------------------

if has('vim_starting')
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'

"" --------------------------------------------------
"" 非同期実行のために
"" --------------------------------------------------

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

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
autocmd FileType vimshell imap 
    \ <buffer><silent><expr><C-d>
    \ vimshell#get_cur_text()=='' ? "\<Esc>\<Plug>(vimshell_exit)" : "\<Del>"

nnoremap <silent> ,ss :VimShell<CR>
autocmd FileType scheme nnoremap <silent> ,sg :VimShellInteractive gosh<CR><Esc><C-w>l
autocmd FileType scheme nnoremap <silent> <F5> <S-v>:VimShellSendString<CR>
autocmd FileType scheme inoremap <silent> <F5> <Esc><S-v>:VimShellSendString<CR>`>i
autocmd FileType scheme vnoremap <silent> <F5> :VimShellSendString<CR>

"" --------------------------------------------------
"" Unite Vim
"" --------------------------------------------------

"" 情弱なので僕にはまだ早い
NeoBundle 'Shougo/unite.vim'

"" --------------------------------------------------
"" Neo Complete Cache (自動補完)
"" --------------------------------------------------

NeoBundle 'Shougo/neocomplcache'

"" 補完ウィンドウの設定
set completeopt+=longest
"" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1
"" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
"" アンダースコア区切りとキャメルケースの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
"" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"" 手動補完を実行できる最小文字数
let g:neocomplcache_manual_completion_start_length = 0
"" 自動的に保管ウィンドを開かない
let g:neocomplcache_disable_auto_complete = 1
"" 自動選択しない
let g:neocomplcache_enable_auto_select = 0
"" キーワード
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
let g:neocomplcache_ctags_arguments_list = {
  \ 'perl' : '-R -h ".pm"'
  \ }
let g:neocomplcache_snippets_dir = "~/.vim/snippets"
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'perl'    : $HOME . '/.vim/dict/perl.dict'
  \ }"

"" スニペットを展開する。スニペットが関係しないところでは行末まで削除
inoremap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
snoremap <expr><C-k> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : "\<C-o>D"
"" 前回行われた補完をキャンセルします
inoremap <expr><C-g> neocomplcache#undo_completion()
" 改行で補完ウィンドウを閉じる
inoremap <expr> neocomplcache#smart_close_popup() : "\<CR>"
"" tabで補完候補の選択を行う
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
"" <C-h>や<BS>を押したときに確実にポップアップを削除します
inoremap <expr> neocomplcache#smart_close_popup() : "\<C-h>"
"" 現在選択している候補を確定します
inoremap <expr> neocomplcache#close_popup() : "\<CR>"
"" 現在選択している候補をキャンセルし、ポップアップを閉じます
inoremap <expr><C-e> neocomplcache#cancel_popup()
"" C-Spaceで補完する
inoremap <Nul> <C-n>

"" --------------------------------------------------
"" Neo Snippet (Snippet補完)
"" --------------------------------------------------

"" 僕にはまだ早い
NeoBundle 'Shougo/neosnippet'

"" --------------------------------------------------
"" Filer
"" --------------------------------------------------

""NeoBundle 'scrooloose/nerdtree'
"""" Ctrl-fでツリー表示切り替え
""noremap  <silent> <C-f>      :NERDTreeToggle<CR>
""vnoremap <silent> <C-f> <Esc>:NERDTreeToggle<CR>
""onoremap <silent> <C-f>      :NERDTreeToggle<CR>
""inoremap <silent> <C-f> <Esc>:NERDTreeToggle<CR>
""cnoremap <silent> <C-f> <C-u>:NERDTreeToggle<CR>
"""" 引数なしでvimを開いたらNERDTreeを起動、引数ありならNERDTreeは起動しない
""autocmd vimenter * if !argc() | NERDTree | endif
"""" 他のバッファをすべて閉じた時にNERDTreeが開いていたらNERDTreeも一緒に閉じる
""autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"""" ツリーに表示しないファイル
""let g:NERDTreeIgnore=['\.clean$', '\.swp$', '\.bak$', '\~$', '\.git']
"""" 隠しファイルを表示する
""let g:NERDTreeShowHidden=1
"""" ツリーウィンドウの幅
""let g:NERDTreeWinSize=35
"""ブックマークや、ヘルプのショートカットをメニューに表示しない
""let g:NERDTreeMinimalUI=1
"""" ツリーの矢印表示
""let g:NERDTreeDirArrows=1
"""" マウスで開けるように
""let g:NERDTreeMouseMode=2

NeoBundle 'Shougo/vimfiler'
nnoremap <C-f> :VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
wincmd p
exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', s:my_action)

let s:my_action = { 'is_selectable' : 1 }
function! s:my_action.func(candidates)
wincmd p
exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', s:my_action)
"" vimデフォルトのエクスプローラをvimfilerで置き換える
let g:vimfiler_as_default_explorer = 1
"" セーフモードを無効にした状態で起動する
let g:vimfiler_safe_mode_by_default=0

"" --------------------------------------------------
"" Ctrl P
"" --------------------------------------------------

NeoBundle 'kien/ctrlp.vim'

"" --------------------------------------------------
"" Jump to pm
"" --------------------------------------------------

NeoBundle 'nakatakeshi/jump2pm.vim'

"" split window vertically and jump to pm fine.
autocmd FileType perl noremap fg :call Jump2pm('vne')<ENTER>
"" jump to pm file in current window
autocmd FileType perl noremap ff :call Jump2pm('e')<ENTER>
"" split window horizontal, and ...
autocmd FileType perl noremap fd :call Jump2pm('sp')<ENTER>
"" open tab, and ...
autocmd FileType perl noremap fd :call Jump2pm('tabe')<ENTER>
"" for visual mode, use Jump2pmV()
autocmd FileType perl vnoremap fg :call Jump2pmV('vne')<ENTER>

"" --------------------------------------------------
"" Power Line
"" --------------------------------------------------

NeoBundle 'Lokaltog/vim-powerline'
let g:Powerline_symbols = 'fancy'

"" --------------------------------------------------
"" Git
"" --------------------------------------------------

NeoBundle 'tpope/vim-fugitive'

"" --------------------------------------------------
"" カッコを自動で閉じる
"" --------------------------------------------------

NeoBundle 'yuroyoro/vim-autoclose'

"" --------------------------------------------------
"" jとkの移動が加速
"" --------------------------------------------------

NeoBundle 'rhysd/accelerated-jk'
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

"" --------------------------------------------------
"" vim間のyankバッファの共有
"" --------------------------------------------------
""
""NeoBundle 'vim-scripts/yanktmp'

"" --------------------------------------------------
"" yank ring
"" --------------------------------------------------
""
""NeoBundle 'vim-scripts/YankRing'

"" --------------------------------------------------
"" Scheme用
"" --------------------------------------------------

""NeoBundle 'slimv.vim'
"" 春山さんのschemeの設定を使う
NeoBundle 'haruyama/scheme.vim'
autocmd FileType scheme :let is_gauche=1
autocmd FileType scheme setlocal complete-=k
autocmd FileType scheme setlocal complete+=k~/.gosh_completions

"" --------------------------------------------------
"" gosh REPL
"" --------------------------------------------------

""NeoBundle 'aharisu/vim_goshrepl'
""let g:neocomplcache_keyword_patterns['gosh-repl']="[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"
""let g:gosh_buffer_direction='v'
""autocmd FileType scheme vmap <F5> <Plug>(gosh_repl_send_block)

"" --------------------------------------------------
"" シンタックスハイライト
"" --------------------------------------------------
""
""filetype plugin indent on
""filetype indent on
""syntax on
""
""NeoBundle 'scrooloose/syntastic'
""
""let g:syntastic_check_on_open=0   " ファイルを開いたときはチェックしない
""let g:syntastic_check_on_save=1   " 保存時にはチェック
""let g:syntastic_auto_loc_list=1   " エラーがあったら自動でロケーションリストを開く
""let g:syntastic_loc_list_height=6 " エラー表示ウィンドウの高さ
""set statusline+=%#warningmsg#     " エラーメッセージの書式
""set statusline+=%{SyntasticStatuslineFlag()}
""set statusline+=%*
"""" JavaScriptでjshintを使う
""let g:syntastic_javascript_checker = 'jshint'
""
""let g:syntastic_mode_map = {
""\ 'mode': 'active',
""\ 'active_filetypes': ['javascript', 'perl'],
""\ 'passive_filetypes': []
""\ }
"""" エラー表示マークを変更
""let g:syntastic_enable_signs=1
""let g:syntastic_error_symbol='✗'
""let g:syntastic_warning_symbol='⚠'

"" --------------------------------------------------
"" アウトライン
"" --------------------------------------------------
""
""NeoBundle 'h1mesuke/unite-outline'
""nnoremap <C-o> :<C-u>Unite outline<CR>
""nnoremap <C-o> :<C-u>Unite -no-quit -vertical -winwidth=30 -toggle outline<CR>

"" --------------------------------------------------
"" Ctrl-p
"" --------------------------------------------------

NeoBundle 'kien/ctrlp.vim'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

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
inoremap <C-a> <Home>
inoremap <C-e> <End>
noremap <C-a> <Home>
noremap <C-e> <End>
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
"" コピペ
xnoremap <C-c> y`>
xnoremap <C-x> x
inoremap <C-v> <Esc>P
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

