colorscheme Tomorrow-Night-Eighties
"colorscheme seoul256
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

set showmatch
set encoding=utf-8
set t_Co=256
set backspace=indent,eol,start
set hidden

set foldmethod=indent
set foldlevel=99

set visualbell

"set iskeyword-=_

let g:airline_powerline_fonts = 1
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kana/vim-fakeclip'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-commentary'
Plugin 'scrooloose/nerdtree.git'
Plugin 'elentok/plaintasks.vim'
Plugin 'wincent/command-t'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/syntastic.git'
Plugin 'tpope/vim-markdown'
Plugin 'junegunn/rainbow_parentheses.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'matschaffer/vim-islime2'
Plugin 'tpope/vim-fireplace.git'
Plugin 'tmhedberg/SimpylFold'
Plugin 'airblade/vim-gitgutter'

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
    autocmd FileType lisp,clojure,scheme,python,ruby RainbowParentheses
augroup END

let mapleader="\<Space>"

nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>

noremap % v%

" Explore mode
let g:netrw_liststyle=3
nmap <leader>e :NERDTreeToggle<CR>
nmap <silent> // :nohlsearch<CR>
nmap <silent> <Leader>/ :nohlsearch<CR>

" nmap <S-Enter> O<Esc>
" nmap <CR> o<Esc>

nmap <Leader>d "_diw
nmap <Leader>c "_ciw

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

cmap w!! w !sudo tee % >/dev/null
command R !./%

nnoremap <silent> <S-UP>   :move-2<CR>==
nnoremap <silent> <S-DOWN> :move+<CR>==
xnoremap <silent> <S-UP>   :move-2<CR>gv=gv
xnoremap <silent> <S-DOWN> :move'>+<CR>gv=gv

" vmap <Leader>y "+y
" vmap <Leader>d "+d
" nmap <Leader>p "+p
" nmap <Leader>P "+P
" vmap <Leader>p "+p
" vmap <Leader>P "+P

"spellcheck
set spelllang=en_us,ru_ru
nmap <silent> <leader>d :set spell!<CR>

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
match Error /\s\+$/

imap <S-Tab> <C-P>
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
"map <Leader>ra :%s/
"nmap <leader>b :CtrlPBuffer<cr>
" nmap <silent> <leader>ev :e ~/.vimrc<CR>
" nmap <silent> <leader>sv :so ~/.vimrc<CR>
nmap <leader>todo :vs ~/notes/ops.todo<cr>

:iab <expr> 0--- strftime("# %c")

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

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

" vim-slime settings
" let g:slime_target = "tmux"
" let g:slime_python_ipython = 1
" let g:slime_default_config = {"socket_name": "default", "target_pane": ":"}

let g:islime2_29_mode=1


function! ToggleMouse()
    " check if mouse is enabled
    if &mouse == 'a'
        " disable mouse
        set mouse=
    else
        " enable mouse everywhere
        set mouse=a
    endif
endfunc

