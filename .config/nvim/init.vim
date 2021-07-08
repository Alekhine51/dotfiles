

" vim-plug "

call plug#begin()


Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'

call plug#end()

colorscheme gruvbox

syntax enable

" line wrap
set wrap

" line numbers
set number

" displays filename in window title
set title

" auto indents using the previous line's indentation
set autoindent

" convert tabs to spaces
set expandtab

" enable mouse mode

set mouse=nvi

