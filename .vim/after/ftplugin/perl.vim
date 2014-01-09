if exists('b:did_after_ftplugin_perl')
  finish
endif
let b:did_after_ftplugin_perl = 1
let s:save_cpo = &cpo
set cpo&vim

setl ts=4 sw=4 sts=4 expandtab shiftround
setlocal formatoptions-=r " 挿入モードで改行した時に # を自動挿入しない
setlocal formatoptions-=o " ノーマルモードで o や O をした時に # を自動挿入しない

let g:syntastic_perl_lib_path = ['./lib', $PERL5LIB]

nnoremap <buffer> <silent> ,f :!perldoc -f <cword><Enter>

"" --------------------------------------------------
"" Jump2pmの設定
"" --------------------------------------------------

"" split window vertically and jump to pm fine.
noremap <silent> fg :call Jump2pm('tabe')<ENTER>
"" jump to pm file in current window
noremap <silent> ff :call Jump2pm('e')<ENTER>
"" split window horizontal, and ...
noremap <silent> fh :call Jump2pm('sp')<ENTER>
"" open tab, and ...
noremap <silent> fv :call Jump2pm('vsp')<ENTER>
"" for visual mode, use Jump2pmV()
vnoremap <silent> fg :call Jump2pmV('tabe')<ENTER>

let &cpo = s:save_cpo
unlet s:save_cpo
