noremap <silent> <Leader>t=  :Tabular /=/<CR>
noremap <silent> <Leader>th  :Tabular /=>/<CR>
noremap <silent> <Leader>t#  :Tabular /#/<CR>
noremap <silent> <Leader>t\| :Tabular /\|/<CR>
noremap <silent> <Leader>tc  :Tabular /\/\//<CR>
noremap <silent> <Leader>t:  :Tabular /:/<CR>
noremap <silent> <Leader>t,  :Tabular /,/<CR>
" YAML-style
noremap <silent> <Leader>ty  :Tabular /:\zs/<CR>

vnoremap <silent> <Leader>t<Space> :Tabular multiple_spaces<CR>
autocmd VimEnter * :AddTabularPipeline! multiple_spaces / \{2,}/
    \ map(a:lines, "substitute(v:val, ' \{2,}', '  ', 'g')")
    \   | tabular#TabularizeStrings(a:lines, '  ', 'l0')

noremap <silent> <Leader>=> :Align @1 =><CR>
noremap <silent> <Leader>== =