if &compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

if has('nvim')
  let s:dein_cache_path = expand('~/.cache/nvim/dein')
else
  let s:dein_cache_path = expand('~/.cache/vim/dein')
endif

let s:dein_path = s:dein_cache_path . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~ '/dein.vim'
  if !isdirectory(s:dein_path)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_path
  endif
  execute 'set runtimepath+=' . fnamemodify(s:dein_path, ':p')
endif

if dein#load_state(s:dein_cache_path)
  call dein#begin(s:dein_cache_path)

  call dein#load_toml('~/.config/nvim/dein.toml', {'lazy' : 0})
  call dein#load_toml('~/.config/nvim/deinlazy.toml', {'lazy' : 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

runtime! ./my/basic.vim
runtime! ./my/keybind.vim
