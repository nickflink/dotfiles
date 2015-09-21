"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  general options
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set background=dark
set number
set shiftwidth=2
set tabstop=2
set expandtab
set list listchars=tab:»·,trail:·

set hlsearch
set ignorecase
set foldmethod=indent
set foldlevelstart=99
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
autocmd Filetype python match ErrorMsg '\%>500v.\+'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  golang
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source $HOME/.vim/a.vim
source $HOME/.vim/html.vim
source $HOME/.vim/matchit.vim
source $HOME/.vim/pig.vim
filetype plugin on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  unicode suppoort
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif
