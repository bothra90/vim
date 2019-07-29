set noautochdir
" setup vim-plug package manager.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'jremmen/vim-ripgrep'
Plug 'kien/rainbow_parentheses.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/a.vim'
Plug 'w0rp/ale'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
"Plug 'pdavydov108/vim-lsp-cquery'
Plug 'sickill/vim-pasta'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'
Plug 'sjbach/lusty'
Plug 'sjl/gundo.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'easymotion/vim-easymotion'
Plug 'mtth/scratch.vim'
Plug 'majutsushi/tagbar'
Plug 'benmills/vimux'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'rust-lang/rust.vim'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tomtom/tlib_vim'
Plug 'sheerun/vim-polyglot'
" Themes"
Plug 'joshdick/onedark.vim'
Plug 'KeitaNakamura/neodark.vim'
call plug#end()

"setting in incompatibility mode with vi
set nocompatible

"Keyboard tweaks
nnoremap <tab> %
vnoremap <tab> %

" Move cursor by display lines when scrolling (helpful for wrapped lines)
nnoremap j gj
nnoremap k gk

"Map , to leader key
let mapleader=','
let g:mapleader = ","

"map ; to : to prevent more key strokes
nnoremap ; :

"Mapping jj sequence to <ESC>
inoremap jj <ESC>
inoremap jk <ESC>O

"Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"Correcting Typos
cmap WQ wq
cmap wQ wq
cmap Tabe tabe

"For better habit
cmap wq x

"insert a newline below current line
nnoremap <CR> <ESC>o<ESC>k
"insert a newline above when pressing shift-enter
nnoremap <S-CR> <ESC>O<ESC>j
"above on itself does not work for iTerm - so this is a hack
"(http://stackoverflow.com/questions/5388562/cant-map-s-cr-in-vim)
nmap ✠ <S-CR>

"zh/zl for subword motion in vim
map <silent> zh :call search("[A-Z]\\\|\\\>","b")<CR>
map <silent> zl :call search("[A-Z]\\\|\\\>","")<CR>

"insert blank space and enter replace mode at cursor location when pressing space in normal mode
nmap <space> i_<ESC>r

"make K behave opposite of J
nmap K i<cr><ESC>k$

"Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"searching
set ignorecase "Ignore case while searching
set smartcase
set hlsearch "highlight searched term
set incsearch "find as you type search - incremental search
nmap <silent> <leader>/ :nohlsearch<CR>

"removing toolbars and scrollbars
set guioptions-=T
set guioptions-=r
set guioptions-=L

"no backup file creation
set nobackup
set noswapfile

"Vim to have a large undo buffer, a large history of commands,
set history=1000         "remember more commands and search history
set undolevels=1000      "use many muchos levels of undo

"ignore some file extensions when completing names by pressing Tab, and be
set wildignore=*.swp,*.bak,*.pyc,*.class

"silent about invalid cursor moves and other errors.
set visualbell           "don't beep
set noerrorbells         "don't beep

"change the terminal's title
set title

"hidden allows to edit other files using :e without needing to save current buffer
set hidden

"allow mouse motion
set mouse=a

"Show current Working Directory.
"`cmap cwd lcd %:p:h
"`cmap cd. lcd %:p:h

"Set encodings
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

"add highlight to FIXED to C code // TODO -> make work for python and others
syn keyword cTodo contained TODO FIXME XXX FIXED

"To save as sudo, use :w!!
cmap w!! w !sudo tee >/dev/null "%"

"indentation
set autoindent
set smartindent

"Remove backspace issue - make backspace work like most other apps
set backspace=2

"Do not wrap long lines
"set nowrap

" Set colors.
if (has("termguicolors"))
  set termguicolors
endif
set t_Co=16
set background=dark

"Color scheme for vim
colorscheme neodark

let g:neodark#background = '#191919'
let g:airline_theme='onedark'

"filetype specific settings
filetype off
filetype plugin indent on
syntax enable

"tabs and other spacing
set expandtab
"these should be overridden in filetype specific syntax files
set tabstop=2
set shiftwidth=2
set softtabstop=2

au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

""IMPORTANT: grep will sometimes skip displaying the file name if you
""search in a singe file. This will confuse Latex-Suite. Set your grep
""program to always generate a file-name.
set grepprg=grep\ -nH\ $*

"Show mode
set showmode
set showcmd

" Always show statusline. Works best with vim-airline.
set laststatus=2

"Resizing horizontal splits
if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
endif

"auto-read file if modified elsewhere
set autoread

"Fast saving. <leader>w would save the file
nmap <leader>w :w!<cr>

"Highlight current cursor line
set cursorline

"Set 7 lines to the cursor - when moving vertically using j/k
set so=7

"Return to last edit position when opening files (You want this!)
augroup last_edit_pos
    au!
    autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\""|
     \ endif
augroup END

" Insert matching \" by default.
"inoremap " ""<esc>i

"CTRL-A in normal mode for select all
nmap <C-A> <ESC>G$vgg

"Allow backspacing over everything in insertmode
set backspace=indent,eol,start
set whichwrap+=<,>,h,l

"Time out on mapping after two seconds, time out on key codes after
"a tenth of a second
set timeout
set timeoutlen=2000
set ttimeoutlen=100

"code folding stuff
set foldmethod=marker
set foldmethod=indent

"load syntax depending on filetype
" Detect proto files
augroup filetype
au! BufRead,BufNewFile *.proto setfiletype proto
augroup end

"Detect go files
augroup filetype
au! BufRead,BufNewFile *.go setfiletype go
augroup end

"Buck files are python files
augroup filetype
au! BufRead,BufNewFile TARGETS setfiletype python
augroup end

"Config for GitHub Flavored Markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

"Auto-delete any trailing white space on save
autocmd BufWritePre * :%s/\s\+$//e

filetype plugin indent on    " required

" Highlight past column 80, 100
set colorcolumn=81,101 " absolute columns to highlight "
set colorcolumn=+1,+21 " relative (to textwidth) columns to highlight "

"set line numbering to be relative to current line. This goes well with
"vim-numbertoggle plugin
set number relativenumber

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

"----------------- Plugin specific configurations -------------------

" CScope
"map F v%zf
set tags=./tags;/
set autowrite
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  "add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    "else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
endif

"NERDtree settings
let NERDTreeIgnore=['\.o$', '\~$', '\.pyc$', '\.swp']
"Toggle Nerd tree using F2.
map <F2> :NERDTreeToggle<CR>
"NerdTreeMirrorToggle of nerd-tree-tabs is a smarter option
"map <F2> :NERDTreeMirrorToggle<CR>
"Shift-F2 toggles nerdtree in all tabs
map <S-F2> :NerdTreeTabsToggle<CR>
"Don't synchronise view(scroll and cursor position)of different nerdtrees
let g:nerdtree_tabs_synchronize_view=0

"CtrlP configuration
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.m2,*.git  "MacOSX/Linux
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
"let g:ctrlp_user_command = 'find %s -type f'        "MacOSX/Linux

"Rainbow parantheses (highilighting nested brackets)
au VimEnter * RainbowParenthesesToggleAll
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"GUndo
nnoremap <F5> :GundoToggle<CR>

"Tagbar
let g:tagbar_ctags_bin='/bin/ctags'  "Proper Ctags locations
let g:tagbar_width=40                          "Default is 40, seems too wide
nmap <silent> <leader>y :TagbarToggle<CR><C-w><C-w>

"Command-T settings
let g:CommandTMaxFiles=200000


imap <c-space> <Plug>(asyncomplete_force_refresh)
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
autocmd CursorMovedI * if pumvisible() == -1|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" Deoplete for autocompletion
let g:deoplete#enable_at_startup = 1
" Enable experimental completer for rust
let g:racer_experimental_completer = 1

" FB Specific Configuration.
"Integrate with tbgs
source /home/engshare/admin/scripts/vim/biggrep.vim
" Integrate with myc
set rtp+=/usr/local/share/myc/vim
"nmap <leader>t :MYC<CR>
" Python Language Server
au User lsp_setup call lsp#register_server({
    \ 'name': 'pyls',
    \ 'cmd': {server_info->['bash', '-c',
    \   '/data/users/$USER/fbsource/fbcode/experimental/gwicke/vim/fbcode_pyls_wrapper']},
    \ 'whitelist': ['python'],
    \ 'workspace_config': {
    \   'pyls': { 'plugins': { 'pydocstyle': {' enabled': v:true}}}
    \ },
 \ })
" Options from
" https://phabricator.internmc.facebook.com/diffusion/FBS/browse/master/xplat/nuclide/pkg/nuclide-cquery-lsp-rpc/lib/CqueryInitialization.js
if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['bash', '-c',
      \   '/data/users/$USER/fbsource/fbcode/experimental/gwicke/vim/fbcode_cquery_wrapper' ]},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.buckconfig'))},
      \ 'initialization_options': {
      \   'cacheDirectory': '/tmp/cquery_cache',
      \   'index': {
      \     'blacklist': ['.*/buck-out/.*', '.*/third-party-buck/.*']
      \   },
      \   'completion': {
      \     'includeBlacklist': ['.*/buck-out/.*', '.*/third-party-buck/.*'],
      \     'enableSnippets': v:true,
      \   },
      \   'diagnostics': {
      \     'blacklist': ['.*/buck-out/.*', '.*/third-party-buck/.*'],
      \     'onParse': v:true,
      \     'onType': v:true,
      \   },
      \   'resourceDirectory': '',
      \   'discoverSystemIncludes': v:false,
      \   'showDocumentLinksOnIncludes': v:false,
      \   'disableInitialIndex': v:true,
      \   'progressReportFrequencyMs': 500,
      \   'clientVersion': 3,
      \   'codeLens': {
      \        'localVariables': v:false,
      \   },
      \ },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc', 'h'],
      \ })
endif

" Rust Language Server.
if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'nightly', 'rls']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'Cargo.toml'))},
        \ 'whitelist': ['rust'],
        \ })
endif
"let g:rustfmt_command = '/bin/rustfmt'
" Run rustfmt automatically on save.
let g:rustfmt_autosave = 1
" Autocomplete - https://github.com/prabirshrestha/asyncomplete.vim
let g:lsp_async_completion = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
" lsp signs
let g:lsp_signs_enabled = 1         " Show errors in sidebar
let g:ale_sign_column_always = 1    " Always keep sign column visible to avoid jittery experience
let g:lsp_diagnostics_echo_cursor = 0 " Disable echo under cursor when in normal mode
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': ['go'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))
