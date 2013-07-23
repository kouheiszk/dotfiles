if exists('b:did_after_ftplugin_java')
  finish
endif
let b:did_after_ftplugin_java = 1
let s:save_cpo = &cpo
set cpo&vim

setl path+=src/main/java/**,src/test/java/**,src/java/**,src/test/**,src/core/**

let java_highlight_all=1
let java_highlight_functions="style"
let java_highlight_debug=1
let java_space_errors=1
let java_allow_cpp_keywords=1

setl ts=4 sw=4 sts=4 expandtab
let &cpo = s:save_cpo
unlet s:save_cpo

"" [JAVA] :Makeでコンパイル
autocmd FileType java :command! Make call s:Make()
function! s:Make()
  :w
  let path = expand("%")
  let syn = "javac ".path
  let dpath = split(path,".java$")
  let ret = system(syn)
  if ret == ""
    :echo "=======\r\nCompile Success"
  else
    :echo "=======\r\nCompile Failure\r\n".ret 
  endif
endfunction

"" [JAVA] :Doでコンパイル後のファイルを実行 
autocmd FileType java :command! Do call s:Do()
function! s:Do()
  let path = expand("%")
  let dpath = split(path,".java$")
  let syn = "java ".dpath[0]
  let ret = system(syn)
  :echo "=======\r\n実行結果:\r\n".ret
endfunction

"" [JAVA] :Exeでコンパイルしてから実行
autocmd FileType java :command! Exe call s:Javac()
function! s:Javac()
  :w
  let path = expand("%")
  let syn = "javac ".path
  let dpath = split(path,".java$")
  let ret = system(syn)
  if ret == ""
    :echo "=======\r\nCompile Success"
    let syn = "java ".dpath[0]
    let ret = system(syn)
    :echo "=======\r\n実行結果:\r\n".ret
  else
    :echo "=======\r\nCompile Failure\r\n".ret
  endif
endfunction
