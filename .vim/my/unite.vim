let g:unite_enable_start_insert      = 1
let g:unite_winheight                = "10"
let g:unite_winwidth                 = "35"
let g:unite_source_grep_default_opts = '-iRHn --color=none'
let g:unite_source_session_options   = &sessionoptions

" unite mapping
nnoremap <Leader>u: :Unite 
nnoremap <silent> <Leader>ub :<C-u>Unite buffer<CR> 
nnoremap <silent> <Leader>uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> <Leader>ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Leader>us :<C-u>Unite file_mru<CR>
nnoremap <silent> <Leader>ua :<C-u>Unite buffer file_mru bookmark tab<CR>
nnoremap <silent> <Leader>uy :<C-u>Unite history/yank<CR> 
nnoremap <silent> <Leader>uo :<C-u>Unite outline -vertical<CR>
nnoremap <silent> <Leader>um :<C-u>Unite mark<CR>
nnoremap <silent> <Leader>uc :<C-u>Unite command<CR>
nnoremap <silent> <Leader>ut :<C-u>Unite tab<CR>
nnoremap <silent> <leader>ug :<C-u>Unite grep:%<CR>

call unite#custom_default_action('file', 'above')
call unite#custom_default_action('file_mru', 'above')
call unite#custom_default_action('file/new', 'above')
call unite#custom_default_action('buffer', 'above')
call unite#custom_default_action('tab', 'above')
call unite#custom_default_action('bookmark', 'above')
call unite#custom_default_action('command', 'above')
call unite#custom_default_action('mark', 'above')

augroup UniteWindowKeyMaps
    autocmd!
    autocmd FileType unite noremap <silent><buffer><expr> <C-j> unite#do_action('split')
    autocmd FileType unite noremap <silent><buffer><expr> <C-l> unite#do_action('vsplit')
    autocmd FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
    autocmd FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q
    autocmd FileType unite call UnmapAltKeys()
augroup END

function! UnmapAltKeys()
    " almost for unite to avoid Alt keys does not fire normal <Esc>
    " noremap <Esc> to avoid <Esc>* mappings fired
    inoremap <buffer> <silent> <Plug>(esc) <Esc>
    imap <buffer> <Esc>t <Plug>(esc)t
    imap <buffer> <Esc>t <Plug>(esc)t
endfunction
