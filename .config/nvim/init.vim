"TODO Configure completion
"TODO configure snippets
"TODO configure quick-fix-lists
"TODO configure a file picker

" vim-plug "

" automate installation

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
"Comment lines
Plug 'numToStr/Comment.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'mcchrish/zenbones.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Don't forget to install the parsers (:TSinstall <lang>)
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-surround'
Plug 'phaazon/hop.nvim'
Plug 'junegunn/goyo.vim'

" Telescope requires plenary to function
Plug 'nvim-lua/plenary.nvim'
" The main Telescope plugin
" Plug 'nvim-telescope/telescope.nvim'
" An optional plugin recommended by Telescope docs
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }

call plug#end()

lua require('Comment').setup()

" LSP config (Needs to have language servers installed, Plug doesn't take care of it)
lua << EOF


local lsp = require "lspconfig"
lsp.hls.setup {} -- Haskell language server

require 'nvim-treesitter.configs'.setup {
  -- One of "all", "maintained" (parsers with maintainers), or a list of languages
  ensure_installed = "maintained",

  -- Install languages synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing
  ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- list of language that will be disabled
    disable = {},

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require 'hop'.setup()
vim.api.nvim_set_keymap('n', 'w', "<cmd>lua require'hop'.hint_words()<cr>", {})
--vim.api.nvim_set_keymap('n', 'w', "hop.hint_words()", {})
vim.api.nvim_set_keymap('n', 'f', "<cmd>lua require'hop'.hint_lines_skip_whitespace()<cr>", {})
vim.api.nvim_set_keymap('n', 'c', "<cmd>lua require'hop'.hint_char1()<cr>", {})

EOF

set termguicolors
set background=dark
colorscheme gruvbox 

syntax enable

" line wrap
set wrap

" line numbers
set number

" displays filename in window title
set title

" indenting
set autoindent
set smartindent

" convert tabs to spaces
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" enable mouse mode
set mouse=nvi

" more intuitive splits
set splitbelow
set splitright

" scroll when x numbers from the bottom
set scrolloff=8

" share vim and system clipboard
set clipboard+=unnamedplus

" key bindings
let mapleader = "\<SPACE>"

" gamer mode activated
" map w k
" map a h
" map s j
" map d l
