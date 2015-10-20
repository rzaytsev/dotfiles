colorscheme Tomorrow-Night-Eighties

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
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set showmode " Show the current mode
set ruler " Show the cursor position
set title " Show the filename in the window titlebar
set showcmd " Show the (partial) command as it’s being typed
set smartindent
set showmatch
set encoding=utf-8
set t_Co=256 
set backspace=indent,eol,start
set hidden

set foldmethod=indent
set foldlevel=99

"set iskeyword-=_

let g:airline_powerline_fonts = 1
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'bling/vim-airline'
Plugin 'nanotech/jellybeans.vim'
Plugin 'kana/vim-fakeclip'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree.git'
Plugin 'wincent/command-t'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/syntastic.git'
Plugin 'tpope/vim-markdown'

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

let mapleader="\<space>"

" Explore mode
let g:netrw_liststyle=3
nmap <leader>e :NERDTreeToggle<CR>
nmap <silent> <Leader>\ :nohlsearch<CR>

nmap <Leader>d diw
nmap <Leader>c ciw

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nnoremap B ^
nnoremap E $

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set splitbelow
set splitright

nmap <C-e> $
nmap <C-a> 0
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>
 

cmap w!! w !sudo tee % >/dev/null
command R !./% 

nnoremap <silent> <S-Up>   :move-2<CR>==
nnoremap <silent> <S-Down> :move+<CR>==
xnoremap <silent> <S-Up>   :move-2<CR>gv=gv
xnoremap <silent> <S-Down> :move'>+<CR>gv=gv

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P


" imap <S-Tab> <C-P>
:nnoremap <Tab> :bnext<CR>:redraw<CR>:ls<CR>
:nnoremap <S-Tab> :bprevious<CR>:redraw<CR>:ls<CR>
:nmap j gj
:nmap k gk
:nmap <S-i> i_<Esc>r
:nmap <S-C> <Plug>CommentaryLine
:nmap \l :setlocal number!<CR>
:nmap <Leader>o :set paste!<CR>
inoremap jj <ESC>l
inoremap оо <ESC>l

:iab <expr> 0--- strftime("# %c")

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'


" nmap <silent> <leader>ev :e $MYVIMRC<CR>
" nmap <silent> <leader>sv :so $MYVIMRC<CR>

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif


"syntastic plugin
:nmap <Leader>s :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_python_checkers = ['pylint']

" Folds
" set foldmethod=indent   " Fold based on indent
" set foldnestmax=3       " Deepest fold is 3 levels
" set nofoldenable        " Don't fold by default

