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
"" normalモードで、;でコマンドモードに入る
noremap ; :
"" Escでサーチのハイライトを解除する
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>
