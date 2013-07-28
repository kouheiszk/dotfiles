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

call smartinput#define_rule({ 'at': '{\_s*\%#\_s*}'  , 'char': '<Enter>', 'input': '<Enter><C-o>O' })
call smartinput#define_rule({ 'at': '(\_s*\%#\_s*)'  , 'char': '<Enter>', 'input': '<Enter><C-o>O' })

"" --------------------------------------------------
"" endwise
"" --------------------------------------------------

"" http://cohama.hateblo.jp/entry/20121017/1350482411
let g:endwise_no_mappings = 1
augroup my_endwise_with_smartinput
  autocmd!
  autocmd FileType ruby,sh,zsh,vim imap <buffer> <CR> <CR><Plug>DiscretionaryEnd
augroup END

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

let g:ctrlp_map                 = '<Leader><C-p>'
let g:ctrlp_by_filename         = 1
let g:ctrlp_jump_to_buffer      = 2
let g:ctrlp_open_new_file       = 't' " open in a new tab
let g:ctrlp_open_multiple_files = 't'
let g:ctrlp_max_files           = 0
let g:ctrlp_mruf_max            = 1000
let g:ctrlp_user_command        = ['.git', 'cd %s && git ls-files --exclude-standard'] " speedup
let g:ctrlp_prompt_mappings     = { 
      \ 'AcceptSelection("e")': ['<c-cr>', '<2-LeftMouse>'],
      \ 'AcceptSelection("h")': ['<c-s>'],
      \ 'AcceptSelection("t")': ['<c-t>', '<cr>'],
      \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
      \ }

"" --------------------------------------------------
"" Quick Highlight
"" --------------------------------------------------

nmap <Leader>h <Plug>(quickhl-toggle)
xmap <Leader>h <Plug>(quickhl-toggle)
nmap <Leader>H <Plug>(quickhl-reset)
xmap <Leader>H <Plug>(quickhl-reset)

