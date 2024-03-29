colorscheme Tomorrow-Night-Eighties

syntax on
set ai                  " auto indenting
set history=400         " keep 400 lines of history
set ruler               " show the cursor position
set hlsearch            " highlight the last searched term
set nocompatible        " Make Vim more useful
set cursorline        " Highlight current line
set hlsearch            " Highlight searches
set ignorecase          " Ignore case of searches
set incsearch           " Highlight dynamically as pattern is typed
set laststatus=2        " Always show status line
set showmode            " Show the current mode
set ruler               " Show the cursor position
set showcmd " Show the (partial) command as it’s being typed
set smartindent
set tabstop=4           " Make tabs as wide as two spaces
set softtabstop=2
set shiftwidth=4
set expandtab
set undofile
set undodir=~/.config/nvim/undodir
set backupdir=~/.config/nvim/.backup/
set directory=~/.config/nvim/.swp/
set noswapfile
set showmatch matchtime=3
set autoread
set encoding=utf-8
set t_Co=256
set backspace=indent,eol,start
set hidden

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable " Disable folding at startup.

set foldlevel=99
" set scrolloff=999
set visualbell
set ttyfast
set completeopt-=preview
set nobackup
set nowritebackup
set cmdheight=2
set shortmess+=c

set splitbelow
set splitright
set formatoptions+=j

set updatetime=300
set mouse=
" set termguicolors

set clipboard=unnamed

" set relativenumber
set number

set rtp+=/usr/local/opt/fzf

call plug#begin('~/.config/nvim/plugged')

"https://github.com/junegunn/fzf.vim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'Raimondi/delimitMate'
Plug 'liuchengxu/vista.vim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'airblade/vim-gitgutter'
Plug 'duggiefresh/vim-easydir'
Plug 'hashivim/vim-terraform'
Plug 'nelstrom/vim-visual-star-search'
Plug 'bogado/file-line'
Plug '907th/vim-auto-save'
Plug 'fatih/vim-go', "{ 'tag': '*' } https://github.com/fatih/vim-go-tutorial
Plug 'simnalamburt/vim-mundo'
Plug 'scrooloose/nerdtree'
" Plug 'Yggdroot/indentLine'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'davidhalter/jedi-vim'
Plug 'alfredodeza/pytest.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dbridges/vim-markdown-runner'
Plug 'itchyny/lightline.vim'
Plug 'wikitopian/hardmode'
Plug 'vim-autoformat/vim-autoformat'

Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

Plug 'lukas-reineke/indent-blankline.nvim'

call plug#end()

filetype off
filetype plugin indent on      " use the file type plugins

let mapleader="\<Space>"

let g:coq_settings = { 'auto_start': 'shut-up' }



" Vista
let g:vista_executive_for = {
      \ 'tf': 'coc',
      \ 'terraform': 'coc',
      \ }
" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1

" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
let g:vista#renderer#icons = {
      \   "function": "\uf794",
      \   "variable": "\uf71b",
      \  }

" lightline
set noshowmode

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': {
      \ 'n' : 'N',
      \ 'i' : 'I',
      \ 'R' : 'R',
      \ 'v' : 'V',
      \ 'V' : 'VL',
      \ "\<C-v>": 'VB',
      \ 'c' : 'C',
      \ 's' : 'S',
      \ 'S' : 'SL',
      \ "\<C-s>": 'SB',
      \ 't': 'T',
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


noremap <Leader><Leader> :NvimTreeToggle<cr>

let NERDTreeShowHidden=1

" IndentLine
let g:indentLine_enabled = 1
let g:indentLine_char='┊'


" autoSave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

"Show 'invisible' characters
set list
set listchars=tab:•·,trail:•,extends:>,precedes:<

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \ exe "normal g'\"" |
      \ endif |
      \ endif

vnoremap < <gv
vnoremap > >gv

nnoremap n nzz
nnoremap N Nzz

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

nnoremap <Tab> :Buffers<CR>
nmap gn :bn<cr>
nmap gp :bp<cr>


" CoC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

" inoremap <silent><expr> <TAB>
"       \ coc#pum#visible() ? coc#pum#next(1):
"       \ <SID>check_back_space() ? "\<Tab>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" " Make <CR> to accept selected completion item or notify coc.nvim to format
" " " <C-g>u breaks current undo, please make your own choice.
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"       \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction


" FZF
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '~50%' }
" nnoremap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>
nmap <leader>H :History!<CR>
nmap <leader>a :Rg<CR>
nmap <leader>A :Rg!<CR>
nmap <leader>3 :Files<CR>

nmap <leader>0 :Vista finder<CR>
nmap <leader>V :Vista!!<CR>
" nmap <leader>T :BTags<CR>

nmap <Leader>/ :BLines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>\ :Lines<CR>
" nmap <Leader>t :BTags<CR>
" nmap <Leader>T :Tags<CR>

noremap <leader>f :Autoformat<CR>

function! ContextualFZF_git()
  " Determine if inside a git repo
  silent exec "!git rev-parse --show-toplevel"
  redraw!

  let s_path = expand('%:p:h')
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
nnoremap <Leader>E :call ContextualFZF_git()<CR>

function! ContextualFZF()
  let s_path = expand('%:p:h')
  let command = 'fd --type f --hidden --exclude .git .'
  call fzf#run({
        \'source': command,
        \'sink': 'e',
        \'down': '50%',
        \})
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


""
"let g:HardMode_level = 'wannabe'
"let g:HardMode_hardmodeMsg = 'Don`t use this!'
"autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>

inoremap <ESC> <ESC>l

cmap w! w !sudo tee % >/dev/null

"
" Automatically removing all trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
match Error /\s\+$/

nnoremap <C-j> <C-d>zz
nnoremap <C-k> <C-u>zz

nmap j gj
nmap k gk

nmap <S-C> <Plug>CommentaryLine
nmap <Leader>P :set paste!<CR>

nnoremap <leader>l :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" nmap <silent> <leader>ev :e ~/.vimrc<CR>
" nmap <silent> <leader>sv :so ~/.vimrc<CR>
nnoremap <Leader>r :make<CR>
nnoremap <Leader>R :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>

nmap <silent> \\ :nohlsearch<CR>


nnoremap Y yy
map <leader>v {jV$}

set signcolumn=yes


hi CursorLineNR cterm=bold
augroup CLNRSet
  autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END

highlight LineNr ctermfg=244

" https://github.com/vim/vim/blob/master/runtime/doc/russian.txt
" Enable hotkeys for Russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" setlocal spell spelllang=en_us,ru_ru



" SpellCheck
set spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add
set dictionary="/usr/share/dict/words"
hi clear SpellBad
hi SpellBad cterm=underline
hi SpellBad ctermfg=160
hi SpellCap ctermfg=226
nmap <silent> <leader>D :set spell!<CR>


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


" terraform support
au BufNewFile,BufRead *.tf set filetype=terraform
let g:terraform_fmt_on_save = 0


" markdown support
let g:markdown_fenced_languages = ['js=json', 'rb=ruby', 'bash=sh', 'py=python', 'yaml']
let g:vim_markdown_fenced_languages = ['js=json', 'rb=ruby', 'bash=sh', 'py=python', 'yaml']
" au Filetype markdown setlocal spell
au FileType markdown set conceallevel=2
au FileType markdown set expandtab shiftwidth=2 tabstop=4
let g:vim_markdown_folding_level = 99
let g:vim_markdown_conceal_code_blocks = 0
autocmd FileType markdown nnoremap <buffer> <Leader>r :MarkdownRunner<CR>
autocmd FileType markdown nnoremap <buffer> <Leader>R :MarkdownRunnerInsert<CR>
au FileType markdown nmap <Leader>gte :r!~/.scripts/get_today_events.sh +\%c<CR>
au FileType markdown set suffixesadd=.md
highlight htmlH1 ctermfg=yellow
highlight mkdLink ctermfg=blue
highlight mkdURL ctermfg=green
highlight mkdInlineURL ctermfg=green

let g:vim_markdown_new_list_item_indent = 0
" let g:vim_markdown_no_extensions_in_markdown = 1


" python support
au FileType python set expandtab shiftwidth=4 tabstop=8
au FileType python nnoremap <buffer> <F9> :wa<CR>:!clear; python %<CR>
au FileType python set makeprg=python3\ %
au FileType python nnoremap <leader>m :make<CR>
setlocal omnifunc=pythoncomplete#Complete
au FileType python let g:indentLine_enabled = 1
au FileType python setlocal completeopt-=preview
au FileType python nmap <silent><Leader>tf <Esc>:Pytest function<CR>
au FileType python nmap <silent><Leader>tc <Esc>:Pytest class<CR>
au FileType python nmap <silent><Leader>tp <Esc>:Pytest project<CR>
autocmd FileType python iabbrev start #!/usr/bin/env python3
      \<CR><CR>
      \def main():<CR>
      \<esc>0i   xxx<CR>
      \<CR><CR>
      \<esc>0iif __name__ == "__main__":<CR>
      \main()
      \<Esc>?xxx<CR>cw

" C support
autocmd FileType c set expandtab shiftwidth=4 tabstop=8
au FileType c  nnoremap <leader>r :!clear; /usr/local/bin/c %<CR>

" ruby support
au FileType ruby set expandtab shiftwidth=2 tabstop=2 softtabstop=2
au FileType ruby nnoremap <leader>r :wa<CR>:!clear; ruby %<CR>
" autocmd BufNewFile,BufRead *.rb set ft=ruby

" golang support
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
au FileType go set listchars=tab:\ \ ,trail:•,extends:>,precedes:<
au FileType go set expandtab shiftwidth=8 tabstop=8

let g:go_list_type = "quickfix"



au FileType taskpaper set listchars=tab:\ \ ,trail:•,extends:>,precedes:<

" JSON support
au FileType json noremap <buffer> <silent> <expr> <leader>p jsonpath#echo()
au FileType json noremap <buffer> <silent> <expr> <leader>g jsonpath#goto()
au FileType json set expandtab shiftwidth=2 tabstop=8 softtabstop=2

" au FileType go au BufWritePre <buffer> %!gofmt
" let g:go_fmt_options = "-tabs=false -tabwidth=4"

au FileType html set expandtab shiftwidth=2 tabstop=2

" vim
autocmd FileType vim set expandtab shiftwidth=2 tabstop=8 softtabstop=2

" YAML support
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au FileType yaml set listchars=tab:•·,trail:•,extends:>,precedes:<


" au FileType yaml set listchars=tab:\ \ ,trail:•,extends:>,precedes:<
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Show “invisible” characters
" au FileType yaml set listchars=tab:•·,trail:•,extends:>,precedes:<


" Clojure support
au Filetype clojure nmap <leader>ck :Require<cr>

"JS
augroup filetype javascript syntax=javascript

  " rainbow_parentheses
  let g:rainbow#blacklist = [233, 234, 9 ,160]
  augroup rainbow_code
    autocmd!
    autocmd FileType lisp,clojure,scheme,python,ruby,go,json RainbowParentheses
  augroup END


  autocmd Filetype gitcommit setlocal spell


  match ErrorMsg '\%>120v.\+'
  match ErrorMsg '\s\+$'

  fu! ToggleCB()
    let line = getline('.')

    if(match(line, "\\[ \\]") != -1)
      let line = substitute(line, "\\[ \\]", "[x]", "")
    elseif(match(line, "\\[x\\]") != -1)
      let line = substitute(line, "\\[x\\]", "[ ]", "")
    elseif(match(line, "\\[+\\]") != -1)
      let line = substitute(line, "\\[+\\]", "[ ]", "")
    else
      let line = substitute(line, "-", "" , "")
      let line = "- [ ] " . line
    endif

    call setline('.', line)
  endf
  command! ToggleCB call ToggleCB()
  map <silent> <leader>- :ToggleCB<cr>

  iabbrev <expr> ddd strftime('%Y-%m-%d %a')
  iabbrev <expr> DDD strftime("# %c")

  function! ToggleMovement(firstOp, thenOp)
    let pos = getpos('.')
    execute "normal! " . a:firstOp
    if pos == getpos('.')
      execute "normal! " . a:thenOp
    endif
  endfunction

  nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>


  " calc
  ino <C-X> <C-O>yiW<End>=<C-R>=<C-R>0<CR>


lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
})


require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "diff", "dockerfile", "gitcommit",
  "go", "gomod", "hcl", "html", "javascript", "json", "lua", "make", "markdown",
  "markdown_inline", "python", "regex", "toml", "yaml" },
  sync_install = false,
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "markdown", "markdown_inline"},

  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
}

EOF



au BufRead,BufNewFile *.nomad set filetype=hcl
