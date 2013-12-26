"" --------------------------------------------------
"" Neocomplcache
"" --------------------------------------------------

"" http://vim-users.jp/2010/10/hack177/
let g:neocomplcache_enable_at_startup             = 1 " 起動時に有効化
let g:neocomplcache_enable_smart_case             = 1 " 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_underbar_completion    = 0
let g:neocomplcache_enable_camel_case_completion  = 0
let g:neocomplcache_enable_wildcard               = 0
let g:neocomplcache_enable_fuzzy_completion       = 1 " phでpublic_htmlを補完
let g:neocomplcache_fuzzy_completion_start_length = 3
let g:neocomplcache_enable_auto_delimiter         = 1
let g:neocomplcache_max_list                      = 100

let g:neocomplcache_snippets_dir = $home . '/.vim/snippets'

let g:neocomplcache_source_disable = {
    \ 'tags_complete' : 1,
\ }
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'perl'    : $HOME . '/.vim/dict/perl.dict',
    \ 'scheme'  : $HOME . '/.gosh_completions'
\ }

let g:neocomplcache_min_syntax_length = 3 " シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"" テキストモードのファイルタイプを設定
let g:neocomplete#text_mode_filetypes = {
      \ 'gitcommit': 1,
      \ 'vim': 1,
      \ 'text': 1, 
      \ 'javascript': 1, 
      \ 'markdown': 1, 
      \ 'perl': 1, 
      \ 'html': 1,
      \ }

let g:neocomplcache_manual_completion_start_length = 0 " 手動補完を実行できる最小文字数

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"" workaround for gvim
let g:neocomplcache_enable_prefetch = 1

"" Plugin key-mappings.
inoremap <C-k> <Plug>(neosnippet_expand_or_jump)
snoremap <C-k> <Plug>(neosnippet_expand_or_jump)

"" SuperTab like snippets behavior.
inoremap <expr><TAB> neosnippet#expandable() ?  "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
snoremap <expr><TAB> neosnippet#expandable() ?  "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr> neocomplcache#smart_close_popup() : "\<CR>"
inoremap <expr> neocomplcache#smart_close_popup() : "\<C-h>"
inoremap <expr> neocomplcache#close_popup() : "\<CR>"
inoremap <expr><C-e> neocomplcache#cancel_popup()

"" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif
let g:neosnippet#snippets_directory = $HOME . '/.vim/bundle/neosnippet/autoload/neosnippet/'


