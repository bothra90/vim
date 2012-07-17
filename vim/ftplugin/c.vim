" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */
" use intelligent file completion like in the bash
set wildmode=longest:full
set wildmenu

set showmatch

inoremap { {}<esc>i<cr><esc>O

let @d='iif(DEBUG){'
