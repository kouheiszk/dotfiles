function! VimShellSendStringAndMove(line1, line2, string)
  let string = join(getline(a:line1, a:line2), "\<LF>")
  let string .= "\<LF>"
  execute "VimShellSendString " . string
  call cursor(a:line2 + 1, 1)
endfunction

command! -range -nargs=? VimShellSendStringAndMove call VimShellSendStringAndMove(<line1>, <line2>, <q-args>)

vnoremap <silent> ,s :VimShellSendString<CR>
vnoremap <silent> <CR> :VimShellSendStringAndMove<CR>

