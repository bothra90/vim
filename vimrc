"Keyboard tweaks
nnoremap <tab> %
vnoremap <tab> %
nnoremap j gj
nnoremap k gk
let mapleader=','  " Map , to leader key
"map ; to : to prevent more key strokes
nnoremap ; :
" Mapping jj sequence to <esc>
" Not required after mapping CAPS to Esc inoremap jj <Esc>
"Disabling the arrow keys for a while
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
"insert a newline below current line
map <CR> <esc>o<esc>k
"insert a newline above when pressing shift-enter
map <S-CR> <esc>O<esc>j
" zh/zl for subword motion in vim
map <silent> zh :call search("[A-Z]\\\|\\\>","b")<CR>
map <silent> zl :call search("[A-Z]\\\|\\\>","")<CR>
" few small insertion tweaks
nmap <space> i_<esc>r
" make K behave opposite of J
nmap K i<cr><esc>k$
" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$
" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>
 "clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

"setting in incompatibility mode with vi
set nocompatible
"removing toolbars and scrollbars
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
"hidden allows to edit other files using :e without needing to save current
"buffer
set hidden
"
"allow mouse motion
set mouse=a
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h
" Set encodings
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
"set line numbering to be relative to current line
set relativenumber
"add highlight to FIXED to C code TODO -> make work for python and others
syn keyword cTodo contained TODO FIXME XXX FIXED FIXER
"" To save as sudo, use :w!!
cmap w!! w !sudo tee >/dev/null "%"
"indentation
set autoindent
set smartindent
"" Remove backspace issue
set backspace=2 " make backspace work like most other apps
"wrap settings
set nowrap
"
" Color scheme for vim
"Solarized
"let g:solarized_termcolors=16
set background=dark
colorscheme mustang
set t_Co=16
"if has('gui_running')
"  set lines=45
"endif

call pathogen#infect()
filetype off
"filetype specific settings
filetype plugin on
filetype plugin indent on
syntax enable

"tabs and other spacing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab


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

au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

nnoremap <F5> :GundoToggle<CR>

"
" " IMPORTANT: grep will sometimes skip displaying the file name if you
"
"
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

"NERDtree settings
let NERDTreeIgnore=['\.o$', '\~$', '\.pyc$', '\.swp']

"Show mode
set showmode
set showcmd

"search options
set ignorecase "Ignore case while searching
set hlsearch "highlight searched term
set incsearch " find as you type search - incremental search			
"
"Statusline
set laststatus=2
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %c,     "cursor column
set statusline+=\ %P    "percent through file
set statusline+=\ %t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator

"Command-T settings
let g:CommandTMaxFiles=200000

"Rainbow parantheses (highilighting nested brackets)
au VimEnter * RainbowParenthesesToggleAll
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"Eclim related settings
"

"Tagbar
let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations
let g:tagbar_width=40                          " Default is 40, seems too wide
nmap <silent> <leader>y :TagbarToggle<CR><C-w><C-w>

"Supertab settings
" Supertab settings
" supertab + eclim == java win
let g:SuperTabDefaultCompletionTypeDiscovery = [
            \ "&completefunc:<c-x><c-u>",
            \ "&omnifunc:<c-x><c-o>",
            \ ]
let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
let g:SuperTabLongestHighlight = 1

"Resizing horizontal splits
if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
endif

"CtrlP configuration
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " MacOSX/Linux
set wildignore+=tmp\*,*.swp,*.zip,*.exe   " Windows
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ }
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux


"auto-read file if modified elsewhere
set autoread
