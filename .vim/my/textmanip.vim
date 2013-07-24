"" --------------------------------------------------
"" 選択したテキストの移動
"" --------------------------------------------------

vmap <C-j> :<C-u>call textmanip#move('down')<CR>
vmap <C-k> :<C-u>call textmanip#move('up')<CR>
vmap <C-h> :<C-u>call textmanip#move('left')<CR>
vmap <C-l> :<C-u>call textmanip#move('right')<CR>

