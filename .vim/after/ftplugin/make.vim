if exists('b:did_after_ftplugin_make')
  finish
endif
let b:did_after_ftplugin_make = 1
let s:save_cpo = &cpo
set cpo&vim

setl tabstop=4 shiftwidth=4 softtabstop=4 smarttab
let &cpo = s:save_cpo
unlet s:save_cpo
