"no need for the toolbars
set guioptions-=T
set guioptions-=r
set guioptions-=L

" no backup file creation
set nobackup
set noswapfile

" Vim to have a large undo buffer, a large history of commands,
"ignore some file extensions when completing names by pressing Tab, and be
"silent about invalid cursor moves and other errors.
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
"
"
"hidden allows to edit other files using :e without needing to save current
"buffer
set hidden
"
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>"map ; to : to prevent more key strokes
"
nnoremap ; :
"allow mouse motion
"
set mouse=a
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
"
" Map , to leader key
let mapleader=','

" Mapping kj sequence to <esc>
"
inoremap kj <Esc>


" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

"insert a newline below current line

map <CR> <esc>o<esc>k

"insert a newline above when pressing shift-enter
map <S-CR> <esc>O<esc>j

"map capslock key to esc "TODO

"set line numbering
set number

"Disabling the arrow keys for a while
"
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Correcting Typos
cmap W w
cmap WQ wq
cmap wQ wq
cmap Q q
cmap Tabe tabe
" few small insertion tweaks
nmap <space> i_<esc>r
" make K behave opposite of J
nmap K i<cr><esc>k$

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

"add highlight to FIXED to C code TODO -> make work for python and others
syn keyword cTodo contained TODO FIXME XXX FIXED HACK

"" To save as sudo, use :w!!
cmap w!! w !sudo tee >/dev/null "%"

"indentation
set autoindent
set smartindent

"" Remove backspace issue
set backspace=2 " make backspace work like most other apps

" highlight searched term
set hlsearch
"
" find as you type search - incremental search
set incsearch			
"
"wrap lines
set lbr
" curson customization

" Color scheme for vim

"Solarized
set t_Co=16
let g:solarized_termcolors=16
colorscheme solarized
if has('gui_running')
  set background=light
else
  set background=dark
endif

"vim-pathogen
call pathogen#infect()

filetype plugin on
filetype plugin indent on
syntax enable

set ai sw=2 wm=5 sm

set modeline " suggested for Python at http://wiki.python.org/moin/Vim

"setting in incompatibility mode with vi
set nocompatible

set nocp

"map F v%zf 
set tags=./tags;/
set autowrite
if has("cscope")
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
    cs add cscope.out
    " else add database pointed to by environment
  elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
  endif
endif

map  <F12> :set hls!<CR>
imap <F12> <ESC>:set hls!<CR>a
vmap <F12> <ESC>:set hls!<CR>gv

au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

nnoremap <F5> :GundoToggle<CR>


"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
" " search in a singe file. This will confuse Latex-Suite. Set your grep
" " program to always generate a file-name.
set grepprg=grep\ -nH\ $*
"
" " OPTIONAL: This enables automatic indentation as you type.
"
" " OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults
" to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'

"" for automatically exiting from scratch preview pane
autocmd CursorMovedI * if pumvisible() == -1|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
