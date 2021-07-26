

" vim-plug "

call plug#begin()

Plug 'phaazon/hop.nvim'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/goyo.vim'
Plug 'easymotion/vim-easymotion'

call plug#end()

" need to call the lua setup() function
lua << EOF

require 'hop'.setup()

EOF

colorscheme gruvbox

syntax enable

set wrap

" line numbers
set number

" displays filename in window title
set title


set autoindent

" convert tabs to spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" enable mouse mode

set mouse=nvi

" share vim and system clipboard
set clipboard+=unnamedplus

" key bindings

let mapleader = "\<SPACE>"

" gamer mode activated
" map w k
" map a h
" map s j
" map d l

"map w <Plug>(easymotion-bd-w)
"map e <Plug>(easymotion-bd-e)

lua << EOF

vim.api.nvim_set_keymap('n', 'w', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_lines_skip_whitespace()<cr>", {})

EOF
