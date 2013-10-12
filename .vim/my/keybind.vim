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

let mapleader=" "

"" Leaderのショートカット
nnoremap <SID>(toggle-paste)          :<C-u>set paste!<CR>
nnoremap <SID>(toggle-number)         :<C-u>set number!<CR>
nnoremap <SID>(toggle-relativenumber) :<C-u>set relativenumber!<CR>
nmap <silent> <Leader>1 <SID>(toggle-number)
nmap <silent> <Leader>2 <SID>(toggle-relativenumber)
nmap <silent> <Leader>3 <SID>(toggle-paste)

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

"" .vimrcを瞬時に開く
nnoremap <silent> <Space><Space>. :e $MYVIMRC<CR>
"" vimrcの設定を反映
nnoremap <silent> <Space><Space>.. :<C-u>source $MYVIMRC<CR>

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

"" normalモードで、;でコマンドモードに入る
noremap ; :

"" Escでサーチのハイライトを解除する
function! ToggleHighlighting()
  if &hlsearch
    set nohlsearch
  else
    set hlsearch
  endif
endfunction

nmap <silent> <Esc><Esc> :call ToggleHighlighting()<CR>

"" ビジュアルモードで選択した範囲を検索
vnoremap z/ <ESC>/\%V
vnoremap z? <ESC>?\%V

"" 検索時に/をエスケープ
cnoremap <expr>/ getcmdtype() == '/' ? '\/' : '/'

"" window操作
nmap <silent> <C-w>a <C-w>_<C-w>|

"" C-wでトグル
function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! ToggleList(bufname, pfx)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      exec(a:pfx.'close')
      return
    endif
  endfor
  if a:pfx == 'l' && len(getloclist(0)) == 0
      echohl ErrorMsg
      echo "Location List is Empty."
      return
  endif
  let winnr = winnr()
  exec(a:pfx.'open')
  if winnr() != winnr
    wincmd p
  endif
endfunction

nmap <silent> <leader>l :call ToggleList("Location List", 'l')<CR>
nmap <silent> <leader>c :call ToggleList("Quickfix List", 'c')<CR>
