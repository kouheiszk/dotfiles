"" --------------------------------------------------
"" syntasitc
"" --------------------------------------------------

let g:syntastic_mode_maps = { 'mode': 'active',
      \ 'active_filetypes' : [],
      \ 'passive_filetypes': ['java'] 
      \ }

let g:syntastic_error_symbol             = 'E>'
let g:syntastic_warning_symbol           = 'W>'
let g:syntastic_echo_current_error       = 1
let g:syntastic_enable_signs             = 1
let g:syntastic_auto_jump                = 1
let g:syntastic_auto_loc_list            = 2
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height          = 5

