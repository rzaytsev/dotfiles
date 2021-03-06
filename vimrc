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
set cursorlineopt=screenline
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
set backupdir=~/.vim/.backup/
set directory=~/.vim/.swp/
set noswapfile
set showmatch
set autoread
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

" set re=1

" nnoremap ; :
" nnoremap : ;

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

set wildcharm=<C-Z>
" nnoremap <tab> :b <C-Z>

nnoremap <S-Tab> :bnext<CR>:redraw<CR>:ls<CR>
nnoremap <Tab> :Buffers<CR>
" nnoremap <S-Tab> :bprevious<CR>:redraw<CR>:ls<CR>

set rtp+=/usr/local/opt/fzf


" https://github.com/vim/vim/blob/master/runtime/doc/russian.txt
" Enable hotkeys for Russian layout
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz
" setlocal spell spelllang=en_us,ru_ru

"set showbreak=↪

" let g:workspace_powerline_separators = 1
" let g:workspace_tab_icon = "\uf00a"
" let g:workspace_left_trunc_icon = "\uf0a8"
" let g:workspace_right_trunc_icon = "\uf0a9"

" filetype off
" set rtp+=~/.vim/bundle/Vundle.vim/
" call vundle#rc()

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'Raimondi/delimitMate'
" Plugin 'tpope/vim-fireplace.git'
Plug 'ryanoasis/vim-devicons'
" Plug 'airblade/vim-gitgutter'
Plug 'duggiefresh/vim-easydir'
Plug 'hashivim/vim-terraform'
" Plug 'juliosueiras/vim-terraform-completion'
" Plug 'hashivim/vim-consul'
" Plug 'hashivim/vim-vagrant'
" Plug 'hashivim/vim-packer'
" Plug 'hashivim/vim-vaultproject'
Plug 'nelstrom/vim-visual-star-search'
Plug 'bogado/file-line'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug '907th/vim-auto-save'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-dispatch'
Plug 'fatih/vim-go', "{ 'tag': '*' } https://github.com/fatih/vim-go-tutorial
Plug 'junegunn/fzf.vim' "https://github.com/junegunn/fzf.vim
" Plug 'PProvost/vim-ps1'
Plug 'nelstrom/vim-markdown-folding'
Plug 'albertorestifo/github.vim'
Plug 'simnalamburt/vim-mundo'
Plug 'majutsushi/tagbar'
" Plug 'wikitopian/hardmode'
Plug 'tpope/vim-ragtag'
Plug 'mindriot101/vim-yapf'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
" Plug 'isRuslan/vim-es6'
Plug 'maralla/completor.vim'
Plug 'masawada/completor-dictionary'
Plug 'junegunn/vim-easy-align'
Plug 'benmills/vimux'
Plug 'w0rp/ale'
" Plug 'AaronLasseigne/yank-code'
Plug 'rhysd/devdocs.vim'
" Plug 'svermeulen/vim-easyclip'
Plug 'liuchengxu/vista.vim'
Plug 'https://github.com/alok/notational-fzf-vim'
Plug 'mrk21/yaml-vim'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'tmhedberg/SimpylFold'
Plug 'Yggdroot/indentLine'
call plug#end()

" call glaive#Install()
" Optional: Enable codefmt's default mappings on the <Leader>= prefix.
" Glaive codefmt plugin[mappings]
filetype off
filetype plugin indent on      " use the file type plugins


nmap K <Plug>(devdocs-under-cursor)
" let g:devdocs_host = 'localhost:9292'

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

" let g:indentLine_color_term = 239
let g:indentLine_enabled = 0
let g:indentLine_char='┊'

let g:SimpylFold_docstring_preview = 1

"""" notational-fzf-vim
let g:nv_search_paths = ['~/notes']

let g:completor_python_binary = '/usr/local/bin/python3'
let g:completor_gocode_binary = '/Users/rzaytsev/dev/go/bin/gocode'

"GitGutter
let g:gitgutter_enabled = 0

" vimux
let g:VimuxOrientation = "v"
let g:VimuxUseNearest = 1


"ALE
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = {
  \ 'python': ['flake8'],
  \ 'yaml': ['yamllint'],
  \ 'go': ['gofmt', 'govet', 'golint']
  \ }

let g:ale_fixers = {
\   'python': ['black', 'add_blank_lines_for_python_control_statements', 'isort'],
\    '*': ['prettier', 'remove_trailing_lines', 'trim_whitespace']
\}

let g:ale_python_flake8_options='--ignore=E501,E128,E225,E221,C0111'
let g:ale_sign_error = '✖'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:airline#extensions#ale#enabled = 1
let g:ale_linters_explicit = 1

let g:ale_yaml_yamllint_options='~/.config/yamllint/config'

nmap <leader>F <Plug>(ale_fix)


" quickfix shortcuts
nmap ]q :cnext<cr>
nmap ]Q :clast<cr>
nmap [q :cprev<cr>
nmap [Q :cfirst<cr>

"vim-lsp
let g:lsp_signs_enabled = 1         " enable signs
let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼', 'icon': '/path/to/some/icon'} " icons require GUI
let g:lsp_signs_hint = {'text': '*', 'icon': '/path/to/some/other/icon'} " icons require GUI

" if executable('pyls')
"     " pip install python-language-server
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
"         \ })
" endif

"vim-mundo
nnoremap <F5> :MundoToggle<CR>

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3


" vim-sequence-diagram: theme set
"let g:generate_diagram_theme_hand = 1

" enable autoSave
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
let g:auto_save_silent = 1

" let g:XkbSwitchEnabled = 1
" let g:XkbSwitchAssistNKeymap = 1    " for commands r and f
" let g:XkbSwitchAssistSKeymap = 1    " for search lines
" " let g:XkbSwitchLib = '/usr/local/bin/libxkbswitch.dylib'
" let g:XkbSwitchLib = '/usr/local/lib/libInputSourceSwitcher.dylib'

set ttimeoutlen=10
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ""
let g:airline_right_sep = ""
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum2'
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

    " let g:airline_section_b = airline#section#create([g:airline_section_b, ' ', '[', '%{FugitiveStatusline()}', ']'])

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
" map v <Plug>(expand_region_expand)
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

nmap <leader>t :Vista finder<CR>
" tagbar
nmap <leader>T :TagbarToggle<CR>
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
let g:fzf_layout = { 'down': '~50%' }
" nnoremap <leader>b :Buffers<CR>
nmap <leader>h :History<CR>
nmap <leader>H :History!<CR>
nmap <leader>a :Rg<CR>
nmap <leader>A :Rg!<CR>

nmap <Leader>L :BLines<CR>
nmap <Leader>' :Marks<CR>
nmap <Leader>/ :Lines<CR>
" nmap <Leader>t :BTags<CR>
" nmap <Leader>T :Tags<CR>

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


nnoremap n nzz
nnoremap N Nzz


nmap <Leader>z za

vnoremap < <gv
vnoremap > >gv
map q: :q

" Explore mode
let g:netrw_liststyle=3

" ==================== NerdTree ====================
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>F :NERDTreeFind<cr>
let NERDTreeShowHidden=1
nmap <leader>w :FZF ~/notes/<CR>
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
command! R !./%

ino <C-x> <C-O>yiW<End>=<C-R>=<C-R>0<CR>

vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" shift+move
" nnoremap <silent> <S-UP>   :move-2<CR>==
" nnoremap <silent> <S-DOWN> :move+<CR>==
" xnoremap <silent> <S-UP>   :move-2<CR>gv=gv
" xnoremap <silent> <S-DOWN> :move'>+<CR>gv=gv

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

" Automatically removing all trailing whitespace on save
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
nmap <Leader>P :set paste!<CR>
nmap <Leader>p :PFiles<CR>
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

hi SpellBad ctermfg=160
hi SpellCap ctermfg=226

" vim-slime settings
" let g:slime_target = "tmux"
" let g:slime_python_ipython = 1
" let g:slime_default_config = {"socket_name": "default", "target_pane": ":"}

let g:islime2_29_mode=1

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
" function! Tab_Or_Complete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-N>"
"   else
"     return "\<Tab>"
"   endif
" endfunction


" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
  " If completor is already open the `tab` cycles through suggested completions.
  if pumvisible()
    return "\<C-N>"
  " If completor is not open and we are in the middle of typing a word then
  " `tab` opens completor menu.
  elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-R>=completor#do('complete')\<CR>"
  else
    " If we aren't typing a word and we press `tab` simply do the normal `tab`
    " action.
    return "\<Tab>"
  endif
endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab to trigger auto completion.  Default suggests completions as you type.
let g:completor_auto_trigger = 0
inoremap <expr> <Tab> Tab_Or_Complete()



set dictionary="/usr/share/dict/words"

" autocmd FileType * set colorcolumn=0
"python3 -m pylint autocmd FileType ruby,python,javascript,c,cpp,objc,rst let &colorcolumn="120,".join(range(120,999),",")

" " Hard mode on!
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" nnoremap <leader>6 <Esc>:call ToggleHardMode()<CR>
" let g:HardMode_level = 'wannabe'

" terraform support
au BufNewFile,BufRead *.tf set filetype=terraform
autocmd filetype terraform nmap <leader>f :TerraformFmt<CR>
let g:terraform_fmt_on_save = 0


" markdown support
" let g:gfm_syntax_enable_always = 1
" au FileType markdown  setlocal ft=markdown.gfm
au FileType markdown set makeprg=pandoc\ -s\ -c\ gfm.css\ --lua-filter=$HOME/.dotfiles/tl.lua\ -o\ \%\:t.html\ \%\:t;open\ \%:\t.html
au FileType markdown set expandtab shiftwidth=2 tabstop=2 softtabstop=2
au FileType markdown nnoremap <leader>r :.w !bash<CR>
au FileType markdown vmap <Leader><Bslash> :EasyAlign*<Bar><Enter>
au FileType markdown nmap <Leader>t :Toch<Enter>
au FileType markdown execute 'setlocal dictionary=/usr/share/dict/words'
au FileType markdown highlight htmlH1 ctermfg=DarkMagenta
let g:markdown_fenced_languages = ['js=json', 'rb=ruby', 'bash=sh', 'py=python', 'yaml']
let g:vim_markdown_fenced_languages = ['js=json', 'rb=ruby', 'bash=sh', 'py=python', 'yaml']


" autocmd Filetype markdown setlocal spell
" highlight Tag   ctermfg=green
" highlight Contact ctermfg=red
" syntax match Tag  /\s:.\+:\s/
" syntax match Contact /\s@.\+\s/


" python support
autocmd FileType python set expandtab shiftwidth=4 tabstop=8
au FileType python nnoremap <buffer> <F9> :wa<CR>:!clear; python %<CR>
au FileType python set makeprg=python3\ %
au FileType python nmap <Leader>f <Plug>(ale_fix)
au FileType python nmap <Leader>T :!python setup.py test<CR>
au FileType python nmap <Leader>= <Plug>(ale_format)
au FileType python nmap <leader>r :VimuxRunCommand("clear; python3 " . bufname("%"))<CR>
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType python xnoremap <leader>p :w !python3<cr>

au FileType python let g:indentLine_enabled = 1

" au FileType python noremap gd :LspDefinition<CR>

" C support
autocmd FileType c set expandtab shiftwidth=4 tabstop=8
au FileType c  nnoremap <leader>r :!clear; /usr/local/bin/c %<CR>

" ruby support
au FileType ruby set expandtab shiftwidth=2 tabstop=2 softtabstop=2
au FileType ruby nnoremap <leader>r :wa<CR>:!clear; ruby %<CR>
" autocmd BufNewFile,BufRead *.rb set ft=ruby

" golang support
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

au FileType go set noexpandtab shiftwidth=4 tabstop=4
au FileType go nmap <leader>b  <Plug>(go-build)
au FileType go nmap <leader>r  <Plug>(go-run)
au FileType go nmap <Leader>i  <Plug>(go-info)
au FileType go nmap <Leader>c  <Plug>(go-test)
au FileType go nmap <Leader>d  :GoDecls<CR>
au FileType go nmap <Leader>f  :GoFmt<CR>
au FileType go nmap <Leader>]  <Plug>(go-iferr)

au FileType go let g:go_fmt_autosave = 0
au FileType go set listchars=tab:\ \ ,trail:•,extends:>,precedes:<
au FileType gohtmltmpl set expandtab shiftwidth=2 tabstop=2


au FileType taskpaper set listchars=tab:\ \ ,trail:•,extends:>,precedes:<

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

au FileType yaml set listchars=tab:\ \ ,trail:•,extends:>,precedes:<
" set listchars=tab:•·,trail:•,extends:>,precedes:<
" set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_ " Show “invisible” characters
au FileType yaml set listchars=tab:•·,trail:•,extends:>,precedes:<


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

" nnoremap <BS> {
" onoremap <BS> {
" noremap <BS> {

" nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
" onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
" vnoremap <CR> }

" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

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
        else
                let line = substitute(line, "-", "" , "")
                let line = "- [ ] " . line
	endif

	call setline('.', line)
endf
command! ToggleCB call ToggleCB()
nmap <silent> <leader>- :ToggleCB<cr>


" yank history
function! s:yank_list()
  redir => ys
  silent Yanks
  redir END
  return split(ys, '\n')[1:]
endfunction

function! s:yank_handler(reg)
  if empty(a:reg)
    echo "aborted register paste"
  else
    let token = split(a:reg, ' ')
    execute 'Paste' . token[0]
  endif
endfunction

command! FZFYank call fzf#run({
\ 'source': <sid>yank_list(),
\ 'sink': function('<sid>yank_handler'),
\ 'options': '-m',
\ 'down': 12
\ })

nnoremap <leader>Y :FZFYank<CR>

if has("folding")
  set foldenable        " enable folding
  set foldmethod=syntax " fold based on syntax highlighting
  set foldlevelstart=99 " start editing with all folds open

  " toggle folds
  " nnoremap <Space> za
  " vnoremap <Space> za

  set foldtext=FoldText()
  function! FoldText()
    let l:lpadding = &fdc
    redir => l:signs
      execute 'silent sign place buffer='.bufnr('%')
    redir End
    let l:lpadding += l:signs =~ 'id=' ? 2 : 0

    if exists("+relativenumber")
      if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
      elseif (&relativenumber)
        let l:lpadding += max([&numberwidth, strlen(v:foldstart - line('w0')), strlen(line('w$') - v:foldstart), strlen(v:foldstart)]) + 1
      endif
    else
      if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
      endif
    endif

    " expand tabs
    let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
    let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

    let l:info = ' (' . (v:foldend - v:foldstart) . ')'
    let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
    let l:width = winwidth(0) - l:lpadding - l:infolen

    let l:separator = ' … '
    let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
    let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
    let l:text = l:start . ' … ' . l:end

    return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
  endfunction
endif

