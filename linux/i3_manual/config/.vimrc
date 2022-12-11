"Configuration file for VIM

set term=xterm-color
syntax on
set ai
set history=100
set ruler
set hlsearch
filetype plugin indent on
set showcmd
set autoindent
set ignorecase
set title
set number
set mouse=a
set whichwrap+=<,>,[,]

autocmd BufRead *.jsm set filetype=javascript
autocmd BufRead *.xul set filetype=xml
