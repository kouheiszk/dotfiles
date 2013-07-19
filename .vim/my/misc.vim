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


