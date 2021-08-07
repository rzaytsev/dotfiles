let g:go_def_mode = "gopls"
let g:go_fmt_command = "goimports"
let g:go_info_mode = 'gocode'
let g:go_metalinter_command='golangci-lint'
" let g:go_auto_type_info = 1
let g:go_fmt_experimental = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
" let g:go_auto_sameids = 1
let g:go_addtags_transform = "camelcase"
" let g:go_snippet_engine = "neosnippet"
" let g:go_highlight_fields = 1
" let g:go_highlight_types = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1

set noexpandtab shiftwidth=4 tabstop=4
nmap <leader>b  <Plug>(go-build)
nmap <leader>r  <Plug>(go-run)
nmap <Leader>i  <Plug>(go-info)
nmap <Leader>c  <Plug>(go-test)
nmap <Leader>d  :GoDecls<CR>
nmap <Leader>f  :GoFmt<CR>
nmap <Leader>]  <Plug>(go-iferr)

let g:go_fmt_autosave = 0
" set listchars=tab:\ \ ,trail:•,extends:>,precedes:<
set expandtab shiftwidth=4 tabstop=4
set list lcs=tab:\┊\ ,trail:•,extends:>,precedes:<

let g:indentLine_enabled = 1

