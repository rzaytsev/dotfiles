autocmd FileType java setlocal shiftwidth=4 softtabstop=4 expandtab
" autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

lua require('config')

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" set mouse=a
set breakindent
set number
set numberwidth=2
set norelativenumber
set cpoptions+=n
set signcolumn=yes
set updatetime=250
set smartcase
set undofile
set cul
" set undodir=/tmp/.vim/backups
set ignorecase
set scrolloff=3
set completeopt=menu,menuone,noselect
set termguicolors
set clipboard=unnamed

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

let g:vimsyn_embed = 'l'

" supress error during setup
" let g:material_style = 'deep ocean'

colorscheme Tomorrow-Night-Eighties

vmap "y "*y
nmap "y "*y
nmap "Y "*Y
nmap "p "*p
nmap "P "*P

" Edit .vimrc
map <leader>vl :vsp $MYVIMRC<CR>
map <leader>vr :source $MYVIMRC<CR>

nmap <silent> // :nohlsearch<CR>

nnoremap <expr> k (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> j (v:count == 0 ? 'gj' : 'j')

" TODO: improve n+1 line moving by russian keys
nnoremap <expr> л (v:count == 0 ? 'gk' : 'k')
nnoremap <expr> о (v:count == 0 ? 'gj' : 'j')

nnoremap Y yy
map <leader>v {jV$}
nnoremap <leader>l :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>



" Automatically removing all trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
match Error /\s\+$/



" Find files using Telescope command-line sugar
" nnoremap <leader>b <cmd>Telescope buffers<cr>
" nnoremap <leader>sf <cmd>Telescope find_files<cr>
" nnoremap <leader>sb <cmd>Telescope current_buffer_fuzzy_find<cr>
" nnoremap <leader>sg <cmd>Telescope live_grep<cr>
" nnoremap <leader>sd <cmd>Telescope diagnostics<cr>
" nnoremap <leader>sc <cmd>Telescope git_commits<cr>
" nnoremap <leader>sr <cmd>Telescope lsp_references<cr>
nnoremap <leader>so <cmd>Telescope lsp_document_symbols<cr>
" nnoremap <leader>sa <cmd>Telescope lsp_range_code_actions<cr>
" nnoremap <leader>sh <cmd>Telescope help_tags<cr>

" nnoremap <leader><leader> :NvimTreeToggle<CR>
" nnoremap <C-n> :NvimTreeFindFile<CR>

nnoremap <leader>ff :Format<CR>

" nnoremap <leader>S :lua require('spectre').open()<CR>

let g:better_whitespace_enabled=1
" let g:strip_whitespace_on_save=1

" automatically run :PackerCompile whenever plugins.lua is updated
" augroup packer_user_config
"   autocmd!
"   autocmd BufWritePost plugins.lua source ~/.config/nvim/lua/config.lua | PackerCompile
"   autocmd BufWritePost config.lua source ~/.config/nvim/lua/config.lua | PackerCompile
"   autocmd BufWritePost *plugins* source ~/.config/nvim/lua/config.lua | PackerCompile
" augroup end

" Highlight on yank
" nnoremap gV `[v`]
augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
augroup end

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>



let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~50%' }
function! ContextualFZF()
    " Determine if inside a git repo
    silent exec "!git rev-parse --show-toplevel"
    redraw!

    let command = 'fd --type f --hidden --exclude .git .'

    if v:shell_error
        " Search in current directory
        call fzf#run({
              \'source': command,
              \'sink': 'e',
              \'down': '50%',
        \})
    else
        " Search in entire git repo
        call fzf#run({
              \'source': command,
              \'sink': 'e',
              \'down': '50%',
              \'dir':  substitute(system('git rev-parse --show-toplevel'), '\n\+$', '', ''),
        \})
    endif
endfunction
nnoremap <Leader>e :call ContextualFZF()<CR>

function! s:append_dir_with_fzf(line)
  call fzf#run(fzf#wrap({
    \ 'options': ['--prompt', a:line.'> '],
    \ 'source': 'find . -type d',
    \ 'sink': {line -> feedkeys("\<esc>:".a:line.line, 'n')}}))
  return ''
endfunction

cnoremap <expr> <c-x><c-d> <sid>append_dir_with_fzf(getcmdline())

command! -nargs=* -complete=dir Cd call fzf#run(fzf#wrap(
  \ {'source': 'find '.(empty(<f-args>) ? '.' : <f-args>).' -type d',
  \  'sink': 'cd'}))


command! -bang -nargs=? -complete=dir PFiles
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview('right:90%'), <bang>0)


let g:pathToTemplates='~/.vim/snippets/'
function! GoSink(file)
    execute ':0r '.g:pathToTemplates.a:file
endfunction

command! Go call fzf#run({
    \  'source': 'ls '.g:pathToTemplates,
    \  'sink':    function('GoSink')})

command! -bang -nargs=? -complete=dir FFiles
    \ call fzf#vim#files(<q-args>, {'options': '-q '.shellescape(expand('<cexpr>'))})


command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)



inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>



nnoremap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>
nmap <leader>H :History!<CR>
nmap <leader>a :Rg<CR>
nmap <leader>A :Rg!<CR>

nmap <leader>t :Vista finder<CR>
nmap <leader>V :Vista!!<CR>
nmap <leader>T :BTags<CR>

nmap <Leader>/ :BLines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>\ :Lines<CR>
" nmap <Leader>t :BTags<CR>
" nmap <Leader>T :Tags<CR>


" Mouse on/off
nmap <leader>M :call ToggleMouse()<CR>
function! ToggleMouse()
  " check if mouse is enabled
  if &mouse == 'n'
    " disable mouse
    set mouse=
  else
    " enable mouse everywhere
    set mouse=n
  endif
endfunc


nnoremap <Tab> :Buffers<CR>
" CoC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"



" markdown support
let g:markdown_fenced_languages = ['js=json', 'rb=ruby', 'bash=sh', 'py=python', 'yaml']
let g:vim_markdown_fenced_languages = ['js=json', 'rb=ruby', 'bash=sh', 'py=python', 'yaml']
" au Filetype markdown setlocal spell
highlight htmlH1 ctermfg=yellow
" let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_folding_style_pythonic = 1
au FileType markdown set conceallevel=2
au FileType markdown set expandtab shiftwidth=2 tabstop=4
let g:vim_markdown_folding_level = 99
let g:vim_markdown_conceal_code_blocks = 0
autocmd FileType markdown nnoremap <buffer> <Leader>r :MarkdownRunner<CR>
autocmd FileType markdown nnoremap <buffer> <Leader>R :MarkdownRunnerInsert<CR>
au FileType markdown nmap <Leader>gte :r!~/.scripts/get_today_events.sh +\%c<CR>
au FileType markdown set suffixesadd=.md

highlight TAGS ctermfg=yellow
call matchadd("TAGS", '#\w\+')

highlight CONTEXT ctermfg=blue
call matchadd("CONTEXT", '@\a\+')

highlight TODO ctermfg=LightMagenta
call matchadd("TODO", 'TODO\S*')


lua  <<EOF
   require'lspconfig'.terraformls.setup{}
EOF