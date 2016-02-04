" Enforces formatting rules from Google style guide.
" We maintain this ourselves since there are no authoritative .vim files from
" Google (unlike emacs).
"

" Set text width
set textwidth=80
"color column at 81
set colorcolumn=81

" use indents of 2 spaces, and have them copied down lines:
set shiftwidth=2
set shiftround
set autoindent

" for C-like programming, have automatic indentation:
autocmd FileType c,cpp,cc,slang set cindent formatoptions+=ro tabstop=2

" for actual C (not C++) programming where comments have explicit end
" characters, if starting a new line in the middle of a comment automatically
" insert the comment leader characters:
autocmd FileType c set formatoptions+=ro tabstop=2

" Expand tabs to spaces by default.
set expandtab

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8

" This causes single character indent for access specifiers, viz., public,
" private, and protected.
set cinoptions=+g1

" This causes single character indent for code in lines following access
" specifiers such as public, private, etc.
set cinoptions=+h1

" This highlights nullptr as a numeric constant.
syn keyword cppNumber	nullptr

" Taken from stackoverflow for ensuring zero indent after the namespace line.
function! IndentNamespace()
  let l:cline_num = line('.')
  let l:pline_num = prevnonblank(l:cline_num - 1)
  let l:pline = getline(l:pline_num)
  let l:retv = cindent('.')
  while l:pline =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
    let l:pline_num = prevnonblank(l:pline_num - 1)
    let l:pline = getline(l:pline_num)
  endwhile
  if l:pline =~# '^\s*namespace.*'
    let l:retv = 0
  endif
  return l:retv
endfunction
set indentexpr=IndentNamespace()

" clang settings
map  <leader>k :pyf ~/clang/clang-format.py<CR>
inoremap <C-k> <ESC>:pyf ~/clang/clang-format.py<CR>i
