colorscheme Tomorrow-Night-Eighties
set shortmess=at
syntax on               " syntax highlighting
set ai                  " auto indenting
set history=400         " keep 400 lines of history
set ruler               " show the cursor position
set hlsearch            " highlight the last searched term
"set number " Enable line numbers
set nocompatible " Make Vim more useful
set clipboard=unnamed,autoselect " Use the OS clipboard by default (on versions compiled with `+clipboard`)
set wildmenu " Enhance command-line completion
set cursorline " Highlight current line
set tabstop=4 " Make tabs as wide as two spaces
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set showmode " Show the current mode
set ruler " Show the cursor position
set title " Show the filename in the window titlebar
set showcmd " Show the (partial) command as it’s being typed
" indent
set smartindent
set softtabstop=2
set shiftwidth=4
set expandtab
set undofile
set undodir=~/.vim/undodir
set showmatch
set encoding=utf-8
set t_Co=256
set backspace=indent,eol,start
set hidden

set foldmethod=indent
set foldlevel=99
set scrolloff=999
set visualbell

let g:airline_powerline_fonts = 1
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-sensible'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'duggiefresh/vim-easydir'
Plugin 'ConradIrwin/vim-bracketed-paste'

filetype plugin indent on      " use the file type plugins

"hi CursorLine cterm=NONE ctermbg=237
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Show “invisible” characters

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \ exe "normal g'\"" |
      \ endif |
      \ endif

set list
set listchars=tab:•·,trail:•,extends:>,precedes:<

augroup rainbow_code
  autocmd!
  autocmd FileType bash,lisp,clojure,scheme,python,ruby RainbowParentheses
augroup END

let mapleader="\<Space>"

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
" nnoremap <Leader><Leader> <S-v>

vnoremap < <gv
vnoremap > >gv

" Explore mode
let g:netrw_liststyle=3
nmap <leader>e :Explore<CR>
nmap <silent> <Leader>/ :nohlsearch<CR>

" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set splitbelow
set splitright

nmap <C-e> $
nmap <C-a> ^
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>

" Rebind Ctrl-C in insert mode to not only leave insert mode without firing
" InsertLeave events, but also to actually undo the current insert operation
inoremap <C-c> <C-c>u

cmap W! w !sudo tee % >/dev/null
command R !./%

nnoremap <silent> <S-UP>   :move-2<CR>==
nnoremap <silent> <S-DOWN> :move+<CR>==
xnoremap <silent> <S-UP>   :move-2<CR>gv=gv
xnoremap <silent> <S-DOWN> :move'>+<CR>gv=gv

" tab for brackets
nnoremap <tab> %
vnoremap <tab> %

"spellcheck
set spelllang=en_us,ru_ru
nmap <silent> <leader>d :set spell!<CR>

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
match Error /\s\+$/

"imap <C-Tab> <C-P>
nnoremap <Tab> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>:ls<CR>
nnoremap <C-Tab> :bnext<CR>
nmap j gj
nmap k gk
nmap <S-i> i_<Esc>r
nmap <S-C> <Plug>CommentaryLine
inoremap jj <ESC>l
inoremap оо <ESC>l

nmap <Leader>p :set paste!<CR>
nmap <leader>m :call ToggleMouse()<CR>
nnoremap <leader>l :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" nmap <silent> <leader>ev :e ~/.vimrc<CR>
" nmap <silent> <leader>sv :so ~/.vimrc<CR>
nmap <leader>todo :vs ~/notes/ops.todo<cr>
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>

nnoremap Y yy
map <leader>v {V}

" markdown shortcuts
"" underlining headings
map <leader>mh yypVr-
map <leader>mH yypVr=

" expand  0--- into date
:iab <expr> 0--- strftime("# %c")


function! ToggleMovement(firstOp, thenOp)
  let pos = getpos('.')
  execute "normal! " . a:firstOp
  if pos == getpos('.')
    execute "normal! " . a:thenOp
  endif
endfunction

nnoremap <silent> 0 :call ToggleMovement('^', '0')<CR>


"Use TAB to complete when typing words, else inserts TABs as usual.
"Uses dictionary and source files to find matching words to complete.

"See help completion for source,
"Note: usual completion is on <C-n> but more trouble to press all the time.
"Never type the same word twice and maybe learn a new spellings!
"Use the Linux dictionary when spelling is in doubt.
"Window users can copy the file to their machine.
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>


:set dictionary="/usr/dict/words

autocmd FileType * setlocal colorcolumn=0
autocmd FileType ruby,python,javascript,c,cpp,objc,rst let &colorcolumn="120,".join(range(120,999),",")

" python support
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8

" ruby support
autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" vim
autocmd FileType vim setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2

" YAML support
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2
autocmd BufNewFile,BufRead *.sls setlocal ft=yaml

" Clojure support
au Filetype clojure nmap <leader>ck :Require<cr>

