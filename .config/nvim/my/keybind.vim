"" --------------------------------------------------
"" キーマップ
"" --------------------------------------------------
"" コマンド       ノーマル    挿入  コマンド ビジュアル
"" map/noremap        @       -       -        @
"" nmap/nnoremap      @       -       -        -
"" imap/inoremap      -       @       -        -
"" cmap/cnoremap      -       -       @        -
"" vmap/vnoremap      -       -       -        @
"" map!/noremap!      -       @       @        -
"" --------------------------------------------------

let mapleader=" "

"" Leaderのショートカット
nnoremap <SID>(toggle-paste)          :<C-u>set paste!<CR>
nnoremap <SID>(toggle-number)         :<C-u>set number!<CR>
nnoremap <SID>(toggle-relativenumber) :<C-u>set relativenumber!<CR>
nmap <silent> <Leader>1 <SID>(toggle-number)
nmap <silent> <Leader>2 <SID>(toggle-relativenumber)
nmap <silent> <Leader>3 <SID>(toggle-paste)

"" インサートモードを解除したらペーストモードを解除する
autocmd InsertLeave * set nopaste

"" Ctrl-a Ctrl-eで移動できるようにする
function! MoveCursorToHome()
  let c = col(".")
  exec "normal! ^"
  if col(".") == c
    exec "normal! 0"
  endif
endfunction
inoremap <silent> <C-a> <C-o>:call MoveCursorToHome()<CR>
inoremap <C-e> <End>
noremap <silent> <C-a> :call MoveCursorToHome()<CR>
noremap <C-e> <End>
xnoremap <silent> <C-a> :call MoveCursorToHome()<CR>
xnoremap <C-e> <End>

"" Ctrl-Dで消せるようにする
inoremap <C-d> <Nop>
inoremap <C-d> <Del>

"" InsertモードでCtrlで移動可能に
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
nnoremap <C-h> <Left>
nnoremap <C-j> <Down>
nnoremap <C-k> <Up>
nnoremap <C-l> <Right>

"" インデント
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap < <gv
vnoremap > >gv

"" コピー
xnoremap y y`>

"" 検索結果に移動したとき、その位置を画面の中央に
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

"" exモードを使わない
nnoremap Q <Nop>

"" normalモードで、;でコマンドモードに入る
noremap ; :

"" Escでサーチのハイライトをトグルする
function! ToggleHighlighting()
  if &hlsearch
    set nohlsearch
  else
    set hlsearch
  endif
endfunction

nmap <silent> <Esc><Esc> :call ToggleHighlighting()<CR>

"" 検索時に/をエスケープ
cnoremap <expr>/ getcmdtype() == '/' ? '\/' : '/'
