syntax on
set background=dark
set number
set shiftwidth=2
set tabstop=2
set expandtab
set list
set hlsearch
set ignorecase
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
source $HOME/.vim/a.vim
