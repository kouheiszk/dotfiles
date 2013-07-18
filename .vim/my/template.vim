augroup my_template
    autocmd!

    function! s:pm_template()
        let path = substitute(expand('%'), '.*lib/', '', 'g')
        let path = substitute(path, '[\\/]', '::', 'g')
        let path = substitute(path, '\.pm$', '', 'g')

        call append(0, 'package ' . path . ';')
        call append(1, 'use strict;')
        call append(2, 'use warnings;')
        call append(3, '')
        call append(4, '')
        call append(5, '')
        call append(6, '1;')
        call cursor(4, 0)
        " echomsg path
    endfunction
    autocmd BufNewFile *.pm call s:pm_template()

augroup END
