"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  general options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set background=dark
set number
set shiftwidth=2
set tabstop=2
set expandtab
set list
set hlsearch
set ignorecase
"this doesn't work on VIM - Vi IMproved 7.2 (2008 Aug 9, compiled Apr  7 2010 18:43:15)
"set backspace+=start,eol,indent 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  window resizing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if bufwinnr(1)
  map <kPlus> <C-W>+
  map <kMinus> <C-W>-
  map <kDivide> <c-w><
  map <kMultiply> <c-w>>
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  python
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype python set makeprg=pychecker
autocmd Filetype python map <F5> :!python % <CR>
autocmd Filetype python map <F7> :make % <CR>
autocmd Filetype python set expandtab
source $HOME/.vim/a.vim
