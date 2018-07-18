colorscheme Tomorrow-Night-Eighties

set shortmess=at
syntax on               " syntax highlighting
set ai                  " auto indenting
set history=400         " keep 400 lines of history
set ruler               " show the cursor position
set hlsearch            " highlight the last searched term
" set number " Enable line numbers
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
set title titlestring=" Show the filename in the window titlebar
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
set ttyfast
set completeopt-=preview

set re=1

" nnoremap ; :
" nnoremap : ;

set wildcharm=<C-Z>
" nnoremap <tab> :b <C-Z>

nnoremap <Tab> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <S-Tab> :bprevious<CR>:redraw<CR>:ls<CR>

set rtp+=/usr/local/opt/fzf

"set showbreak=↪

" let g:workspace_powerline_separators = 1
" let g:workspace_tab_icon = "\uf00a"
" let g:workspace_left_trunc_icon = "\uf0a8"
" let g:workspace_right_trunc_icon = "\uf0a9"

" filetype off
" set rtp+=~/.vim/bundle/Vundle.vim/
" call vundle#rc()

call plug#begin('~/.vim/plugged')

" Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
" Plug 'elentok/plaintasks.vim'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'vim-syntastic/syntastic'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'Raimondi/delimitMate'
" Plugin 'tpope/vim-fireplace.git'
Plug 'ryanoasis/vim-devicons'
"Plugin 'Shougo/unite.vim'
"Plugin 'wincent/command-t'
"Plugin 'matschaffer/vim-islime2'
"Plugin 'tmhedberg/SimpylFold'
Plug 'airblade/vim-gitgutter'
"Plugin 'kana/vim-fakeclip'
"Plugin 'ctrlpvim/ctrlp.vim'
Plug 'duggiefresh/vim-easydir'
Plug 'hashivim/vim-consul'
Plug 'hashivim/vim-vagrant'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'hashivim/vim-packer'
Plug 'hashivim/vim-vaultproject'
Plug 'nelstrom/vim-visual-star-search'
Plug 'bogado/file-line'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug '907th/vim-auto-save'
Plug 'terryma/vim-expand-region'
Plug 'rizzatti/dash.vim'
Plug 'tpope/vim-dispatch'
Plug 'fatih/vim-go', "{ 'tag': '*' } https://github.com/fatih/vim-go-tutorial
Plug 'junegunn/fzf.vim' "https://github.com/junegunn/fzf.vim
Plug 'PProvost/vim-ps1'
Plug 'lyokha/vim-xkbswitch'
" Plug 'xavierchow/vim-sequence-diagram'
Plug 'nelstrom/vim-markdown-folding'
" Plug 'johngrib/vim-game-code-break'
" Plug 'jdkanani/vim-material-theme'
Plug 'albertorestifo/github.vim'
" Plug 'bagrat/vim-workspace'
" Plug 'editorconfig/editorconfig-vim'
Plug 'simnalamburt/vim-mundo'
" Plug 'Shougo/neocomplete.vim'
Plug 'majutsushi/tagbar'
Plug 'wikitopian/hardmode'
Plug 'tpope/vim-ragtag'
" Plug 'w0rp/ale'
" Plug 'elzr/vim-json'
" Plug 'michalbachowski/vim-wombat256mod'
Plug 'mindriot101/vim-yapf'
" Plug 'Shougo/deoplete.nvim'
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'
" Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'arcticicestudio/nord-vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'isRuslan/vim-es6'
Plug 'maralla/completor.vim'
Plug 'jonhiggs/MacDict.vim'
Plug 'sunaku/vim-dasht'
Plug 'davidoc/taskpaper.vim'
" Plug 'tpope/vim-vinegar'
" Plug 'nvie/vim-flake8'
Plug 'google/vim-maktaba'
" Plug 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plug 'google/vim-glaive'
Plug 'junegunn/gv.vim'
Plug 'mogelbrod/vim-jsonpath'


call plug#end()

" call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
" Glaive codefmt plugin[mappings]
filetype off
filetype plugin indent on      " use the file type plugins

" Use deoplete.
" let g:deoplete#enable_at_startup = 1

" augroup autoformat_settings
"   autocmd FileType bzl AutoFormatBuffer buildifier
"   autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
"   autocmd FileType go AutoFormatBuffer gofmt
"   autocmd FileType html,css,json AutoFormatBuffer js-beautify
"   autocmd FileType python AutoFormatBuffer yapf
"   " Alternative: autocmd FileType python AutoFormatBuffer autopep8
" augroup END


let g:completor_python_binary = '/usr/local/bin/python3'
" let g:completor_racer_binary = '/path/to/racer'
" let g:completor_clang_binary = '/path/to/clang'
let g:completor_gocode_binary = '/Users/rzaytsev/dev/go/bin/gocode'

"DashT
nnoremap <Leader>k :Dasht<Space>
nnoremap <silent> <Leader>K :call Dasht([expand('<cword>'), expand('<cWORD>')])<Return>

"GitGutter
let g:gitgutter_enabled = 0


"vim-mundo
nnoremap <F5> :MundoToggle<CR>

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3


let g:markdown_fenced_languages = ['json', 'ruby', 'sh', 'python', 'yaml']

" terraform format on save: 1 or 0
let g:terraform_fmt_on_save = 0

" vim-sequence-diagram: theme set
"let g:generate_diagram_theme_hand = 1

" enable autoSave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

let g:XkbSwitchEnabled = 1
let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
let g:XkbSwitchAssistSKeymap = 1    " for search lines
" let g:XkbSwitchLib = '/usr/local/bin/libxkbswitch.dylib'
let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'

set ttimeoutlen=10
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ""
let g:airline_right_sep = ""
let g:airline_powerline_fonts = 1
" let g:airline_theme = 'bubblegum2'
let g:airline_skip_empty_sections = 1
let g:airline#extensions#xkblayout#enabled = 0
" let g:airline#extensions#tabline#enabled = 1

function! AirlineInit()
    let g:airline_mode_map = {
      \ '__' : '-',
      \ 'n'  : ' N ',
      \ 'i'  : ' I ',
      \ 'R'  : ' R ',
      \ 'c'  : ' C ',
      \ 'v'  : ' V',
      \ 'V'  : ' V ',
      \ ''   : ' V ',
      \ 's'  : ' S ',
      \ 'S'  : ' S ',
      \ }
  if exists('*GTMStatusline')
    call airline#parts#define_function('gtmstatus', 'GTMStatusline')
    let g:airline_section_b = airline#section#create([g:airline_section_b, ' ', '[', 'gtmstatus', ']'])
  endif

  " call airline#parts#define_raw('time', '%{strftime("%c"}')
  " let g:airline_section_y = airline#sections#create_right(['ffenc', 'time'])

endfunction
autocmd User AirlineAfterInit call AirlineInit()


if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" expand-region
map v <Plug>(expand_region_expand)
map C-v <Plug>(expand_region_shrink)

hi CursorLine cterm=NONE ctermbg=239

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \ if line("'\"") > 0 && line ("'\"") <= line("$") |
      \ exe "normal g'\"" |
      \ endif |
      \ endif

hi SpecialKey ctermfg=239
" hi NonText ctermfg=16 ctermbg=237

set list
" set listchars=tab:•·,trail:•,extends:>,precedes:<
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Show “invisible” characters
set listchars=tab:•·,trail:•,extends:>,precedes:<

let mapleader="\<Space>"

noremap <leader>. @:

" tagbar
nmap <leader>T :TagbarToggle<CR>
nmap <leader>t :TagbarOpenAutoClose<CR>
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }


" FZF
let g:fzf_buffers_jump = 1
nnoremap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>
nmap <leader>H :History!<CR>
nmap <leader>a :Ag<CR>
nmap <leader>A :Ag!<CR>

nmap <Leader>l :BLines<CR>
nmap <Leader>L :Lines<CR>
nmap <Leader>' :Marks<CR>
" nmap <Leader>t :BTags<CR>
" nmap <Leader>T :Tags<CR>

nmap <Leader>/ :Lines<CR>

function! ContextualFZF()
    " Determine if inside a git repo
    silent exec "!git rev-parse --show-toplevel"
    redraw!

    if v:shell_error
        " Search in current directory
        call fzf#run({
          \'sink': 'e',
          \'down': '40%',
        \})
    else
        " Search in entire git repo
        call fzf#run({
          \'sink': 'e',
          \'down': '40%',
          \'dir':  substitute(system('git rev-parse --show-toplevel'), '\n\+$', '', ''),
          \'source': 'git ls-tree --full-tree --name-only -r HEAD',
        \})
    endif
endfunction
nnoremap <Leader>e :call ContextualFZF()<CR>

command! -bang -nargs=? -complete=dir FFiles
    \ call fzf#vim#files(<q-args>, {'options': '-q '.shellescape(expand('<cexpr>'))})


command! -bang -nargs=* Find call fzf#vim#grep( 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)


nnoremap n nzz
nnoremap N Nzz


nmap <Leader>z za

" shortcut for Dash plugin (documentation)
:nmap <silent> <leader>d <Plug>DashSearch

nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :wa<CR>
vnoremap < <gv
vnoremap > >gv

" Explore mode
let g:netrw_liststyle=3
nmap <leader>N :NERDTreeToggle<CR>

nmap <leader>n :FZF ~/notes/<CR>

nmap <silent> \\ :nohlsearch<CR>

"nmap <Leader>c "_ci"

" map <up> <nop>
" map <down> <nop>
" map <left> <nop>
" map <right> <nop>

"map <right> :bn<cr>
"map <left> :bp<cr>


" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

set splitbelow
set splitright

"nmap <C-e> $
"nmap <C-a> ^
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>0
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>

inoremap jj <ESC>l
inoremap jk <ESC>l
"inoremap <silent> <Esc> <Esc>l
" Rebind Ctrl-C in insert mode to not only leave insert mode without firing
" InsertLeave events, but also to actually undo the current insert operation
" inoremap <C-c> <C-c>u

cmap W! w !sudo tee % >/dev/null
command R !./%

ino <C-x> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

nnoremap <silent> <S-UP>   :move-2<CR>==
nnoremap <silent> <S-DOWN> :move+<CR>==
xnoremap <silent> <S-UP>   :move-2<CR>gv=gv
xnoremap <silent> <S-DOWN> :move'>+<CR>gv=gv

" tab for brackets
" nnoremap <tab> %
" vnoremap <tab> %

"spellcheck
" set spelllang=en_us,ru_ru
set spelllang=en_us
set spellfile=~/.vim/spell/en.utf-8.add
hi clear SpellBad
hi SpellBad cterm=underline
nmap <silent> <leader>D :set spell!<CR>

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e
match Error /\s\+$/

"imap <C-Tab> <C-P>
" noremap <Tab> :WSNext<CR>
" noremap <S-Tab> :WSPrev<CR>

"nnoremap <C-Tab> :bnext<CR>
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
inoremap <S-Tab> <C-x><C-f>

nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

nmap j gj
nmap k gk
nmap <S-i> i_<Esc>r
nmap <S-C> <Plug>CommentaryLine
nmap <Leader>p :set paste!<CR>
nmap <leader>m :call ToggleMouse()<CR>
nnoremap <leader>l :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
" nmap <silent> <leader>ev :e ~/.vimrc<CR>
" nmap <silent> <leader>sv :so ~/.vimrc<CR>
nnoremap <Leader>r :make<CR>
nnoremap <Leader>R :%s/\<<C-r><C-w>\>/<C-r><C-w>/g<Left><Left>

nnoremap Y yy
map <leader>v {jV$}

" markdown shortcuts
"" underlining headings
map <leader>mh yypVr-
map <leader>mH yypVr=

:iab <expr> 0--- strftime("# %c")

" syntastic plugin
nmap <Leader>s :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_error_symbol = '⤫'
let g:syntastic_style_error_symbol = '?!'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '..'

let g:syntastic_python_checkers=['pylint', 'flake8']
let g:syntastic_python_pylint_exec = 'python3 -m pylint'
let g:syntastic_python_flake8_exec = 'python3 -m flake8'
" --ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721 --max-line-length=100
"let g:syntastic_yaml_ansible_checkers = ['ansible-lint']


let g:godef_split = 0
let g:go_fmt_fail_silently = 1
let g:go_list_type = 'quickfix'
let g:syntastic_go_checkers = ['golint', 'govet', 'gometalinter', 'gofmt']
let g:syntastic_go_gometalinter_args = ['--disable-all', '--enable=errcheck']

hi SpellBad ctermfg=160
hi SpellCap ctermfg=226

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


set dictionary="/usr/dict/words

" autocmd FileType * set colorcolumn=0
" autocmd FileType ruby,python,javascript,c,cpp,objc,rst let &colorcolumn="120,".join(range(120,999),",")

" " Hard mode on!
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" nnoremap <leader>6 <Esc>:call ToggleHardMode()<CR>
" let g:HardMode_level = 'wannabe'

au BufNewFile,BufRead *.tf set filetype=terraform
autocmd FileType terraform let b:dispatch = 'terraform plan'
autocmd filetype terraform nmap <leader>b :Dispatch<CR>
autocmd filetype terraform nmap <leader>f :TerraformFmt<CR>

au BufNewFile,BufRead *.yml set filetype=yaml

" markdown support
au FileType markdown set makeprg=pandoc\ -s\ -c\ gfm.css\ --lua-filter=$HOME/.dotfiles/tl.lua\ -o\ \%\:t.html\ \%\:t;open\ \%:\t.html
au FileType markdown set expandtab shiftwidth=2 tabstop=2 softtabstop=2
au FileType markdown nnoremap <leader>R :.w !bash<CR>
" autocmd Filetype markdown setlocal spell

" python support
autocmd FileType python set expandtab shiftwidth=4 tabstop=8
au FileType python nnoremap <buffer> <F9> :wa<CR>:!clear; python %<CR>
au FileType python set makeprg=python\ %
au FileType python nmap <Leader>f  :Yapf<CR>
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

function SetPython2()
    let g:syntastic_python_flake8_exec = 'python2'
    let g:syntastic_python_flake8_args = ['-m', 'flake8']
endfunction
function SetPython3()
    let g:syntastic_python_flake8_exec = 'python3'
    let g:syntastic_python_flake8_args = ['-m', 'flake8']
endfunction
call SetPython2()


" C support
autocmd FileType c set expandtab shiftwidth=4 tabstop=8
au FileType c  nnoremap <leader>b :!clear; /usr/local/bin/c %<CR>

" ruby support
au FileType ruby set expandtab shiftwidth=2 tabstop=2 softtabstop=2
au FileType ruby nnoremap <leader>b :wa<CR>:!clear; ruby %<CR>
" autocmd BufNewFile,BufRead *.rb set ft=ruby


let g:go_fmt_command = "goimports"
let g:go_info_mode = 'gocode'
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

au FileType go set noexpandtab shiftwidth=4 tabstop=4
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <Leader>i  <Plug>(go-info)
au FileType go nmap <Leader>d  :GoDecls<CR>
au FileType go nmap <Leader>f  :GoFmt<CR>
au FileType go nmap <Leader>]  <Plug>(go-iferr)

au FileType go let g:go_fmt_autosave = 0
au FileType go set listchars=tab:\ \ ,trail:•,extends:>,precedes:<
au FileType gohtmltmpl set expandtab shiftwidth=2 tabstop=2

au FileType taskpaper set listchars=tab:\ \ ,trail:•,extends:>,precedes:<

au FileType json noremap <buffer> <silent> <expr> <leader>p jsonpath#echo()
au FileType json noremap <buffer> <silent> <expr> <leader>g jsonpath#goto()

" au FileType go au BufWritePre <buffer> %!gofmt
" let g:go_fmt_options = "-tabs=false -tabwidth=4"

au FileType html set expandtab shiftwidth=2 tabstop=2

" vim
autocmd FileType vim set expandtab shiftwidth=2 tabstop=8 softtabstop=2

" YAML support
autocmd FileType yaml set expandtab shiftwidth=2 tabstop=8 softtabstop=2
autocmd BufNewFile,BufRead *.sls set ft=yaml

" Clojure support
au Filetype clojure nmap <leader>ck :Require<cr>

"JS
augroup filetype javascript syntax=javascript

augroup rainbow_code
  autocmd!
  autocmd FileType lisp,clojure,scheme,python,ruby RainbowParentheses
augroup END


autocmd Filetype gitcommit setlocal spell
" autocmd FileType gitcommit setlocal spell
" au BufNewFile,BufRead COMMIT_EDITMSG setlocal spell
" autocmd BufRead,BufNewFile COMMIT_EDITMSG set ft=gitcommit
" autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal spell

" augroup EnableSyntaxHighlighting

"     autocmd! BufWinEnter,WinEnter * nested if exists('syntax_on') && ! exists('b:current_syntax') && ! empty(&l:filetype) && index(split(&eventignore, ','), 'Syntax') == -1 | syntax enable | endif
" autocmd! BufRead * if exists('syntax_on') && exists('b:current_syntax') && ! empty(&l:filetype) && index(split(&eventignore, ','), 'Syntax') != -1 | unlet! b:current_syntax | endif
" augroup END


if v:version > 703 || v:version == 703 && has('patch541')
  set formatoptions+=j
endif

match ErrorMsg '\%>120v.\+'
match ErrorMsg '\s\+$'

nnoremap <BS> {
onoremap <BS> {
noremap <BS> {

nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

map <F11> "dyiw:call MacDict(@d)<CR>


" set foldtext=MyFoldText()
" function MyFoldText()
"   let line = getline(v:foldstart)
"   let sub = substitute(line, '/\*\|\*/\|{{{\d\=', '', 'g')
"   return v:folddashes . sub
" endfunction

fu! ToggleCB()
	let line = getline('.')

	if(match(line, "\\[ \\]") != -1)
		let line = substitute(line, "\\[ \\]", "[x]", "")
	elseif(match(line, "\\[x\\]") != -1)
		let line = substitute(line, "\\[x\\]", "[ ]", "")
	elseif(match(line, "\\[+\\]") != -1)
		let line = substitute(line, "\\[+\\]", "[ ]", "")
	endif

	call setline('.', line)
endf
command! ToggleCB call ToggleCB()
nmap <silent> <leader>- :ToggleCB<cr>
