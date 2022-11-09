autocmd FileType java setlocal shiftwidth=4 softtabstop=4 expandtab
" autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

lua require('config')

set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
silent! colorscheme Tomorrow-Night-Eighties

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

let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

let g:vimsyn_embed = 'l'


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

nnoremap <leader>ff :Format<CR>

let g:better_whitespace_enabled=1

map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>


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


