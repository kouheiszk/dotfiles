function! s:SID()
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze_SID$')
endfunction
 
function! s:SIDP()
  return '<SNR>' . s:SID() . '_'
endfunction
 
function! s:check_flag(flag)
  if exists('b:' . a:flag)
    return b:{a:flag}
  endif
  if exists('g:' . a:flag)
    return g:{a:flag}
  endif
  return 0
endfunction
 
function! s:toggle_flag(flag)
  if !exists(a:flag)
    let {a:flag} = 1
  else
    let {a:flag} = !{a:flag}
  endif
endfunction
 
function! s:get_range(type, mode)
  if a:mode ==# 'o'
    let vm = {
        \ 'line' : 'V',
        \ 'char' : 'v',
        \ 'block' : "\<C-v>" }[a:type]
    let [sm, em] = ['[', ']']
    let save_sel = &selection
    set selection=inclusive
  elseif a:mode ==# 'v'
    let [vm, sm, em] = [a:type, '<', '>']
  end
 
  let save_reg = @"
  execute 'silent normal! `' . sm . vm . '`' . em . 'y'
  let selected = @"
  let @" = save_reg
  if a:mode ==# 'o'
    let &selection = save_sel
  endif
  return selected
endfunction
 
function! s:modulo(n, m)
  let d = a:n * a:m < 0 ? 1 : 0
  return a:n + (-(a:n + (0 < a:m ? d : -d)) / a:m + d) * a:m
endfunction
 
function! s:mkdir(file, ...)
  let f = a:0 ? fnamemodify(a:file, a:1) : a:file
  if !isdirectory(f)
    call mkdir(f, 'p')
  endif
endfunction
 
function! s:has_plugin(name)
  return globpath(&runtimepath, 'plugin/' . a:name . '.vim') !=# ''
  \   || globpath(&runtimepath, 'autoload/' . a:name . '.vim') !=# ''
endfunction

