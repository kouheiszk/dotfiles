command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=iso-2202-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis ++enc = cp932
command! -nargs=0 CdCurrent cd %:p:h
command! ReloadVimrc source $MYVIMRC

set omnifunc=syntaxcomplete#Complete

let g:yankring_history_dir  = $HOME . '/.vim/history'
let g:yankring_manual_clipboard_check = 1

function! RTrim()
  let s:cursor = getpos('.')
  %s/\s\+$//e
  call setpos('.', s:cursor)
endfunction

command! Rtrim :call RTrim()

augroup vimrc-auto-mkdir
  autocmd!
  autocmd BufWritePre * call s:auto_mkdir(expand('<afile>:p:h'), v:cmdbang)
  function! s:auto_mkdir(dir, force)
    if !isdirectory(a:dir) && (a:force ||
          \    input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
      call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
    endif
  endfunction
augroup END

let g:template_vim_template_dir = $HOME . '/.vim/template'
let g:template_vim_template_dirs = [$HOME . '/.vim/template']

"" --------------------------------------------------
"" smartinput - autocomp parenthesis, braces and more
"" --------------------------------------------------

call smartinput#define_rule({ 'at': '\[\_s*\%#\_s*\]', 'char': '<Enter>', 'input': '<Enter><C-o>O' })
call smartinput#define_rule({ 'at': '{\_s*\%#\_s*}'  , 'char': '<Enter>', 'input': '<Enter><C-o>O' })
call smartinput#define_rule({ 'at': '(\_s*\%#\_s*)'  , 'char': '<Enter>', 'input': '<Enter><C-o>O' })

"" --------------------------------------------------
"" endwise
"" --------------------------------------------------

"" http://cohama.hateblo.jp/entry/20121017/1350482411
let g:endwise_no_mappings = 1
augroup my_endwise_with_smartinput
  autocmd!
  autocmd FileType lua,ruby,sh,zsh,vb,vbnet,aspvbs,vim imap <buffer> <CR> <CR><Plug>DiscretionaryEnd
augroup END

"" --------------------------------------------------
"" syntasitc
"" --------------------------------------------------

let g:syntastic_mode_map = { 'mode': 'active',
      \ 'active_filetypes' : [],
      \ 'passive_filetypes': ['java'] 
      \ }
let g:syntastic_error_symbol='E>' " ✗
let g:syntastic_warning_symbol='W>' " ⚠
let g:syntastic_echo_current_error=0 " too heavy, use below one
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=1
let g:syntastic_auto_loc_list=2
nnoremap <leader>sign :sign<CR>
nnoremap <leader>erros :Errors<CR>

"" --------------------------------------------------
"" gundo
"" --------------------------------------------------

let g:gundo_right = 1
let g:gundo_close_on_revert = 1
nnoremap <Leader>G :GundoToggle<CR>

"" --------------------------------------------------
"" indent guide
"" --------------------------------------------------

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

"" --------------------------------------------------
"" ctrl-p
"" --------------------------------------------------

let g:ctrlp_map = '<Leader><C-p>'
let g:ctrlp_max_files = 0
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files --exclude-standard'] " speedup
nnoremap <Leader><C-q> :CtrlPQuickfix<CR>
nnoremap <Leader><C-m> :CtrlPMRU<CR>
nnoremap <Leader><C-c> :CtrlPChangeAll<CR>
nnoremap <Leader><C-l> :CtrlPLine<CR>
nnoremap <Leader><C-t> :CtrlPTag<CR>





