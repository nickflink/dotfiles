"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  general options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set background=dark
set number
set shiftwidth=2
set tabstop=2
set expandtab
set shiftwidth=4
set tabstop=4
set list
set hlsearch
set ignorecase
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
"autocmd Filetype python set tabstop=4
"autocmd Filetype python set shiftwidth=4
autocmd Filetype python set expandtab
"autocmd Filetype python set list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  vim extensions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.vim/a.vim
