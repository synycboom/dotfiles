call plug#begin()

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'posva/vim-vue'
Plug 'neovim/nvim-lspconfig'
Plug 'terrortylor/nvim-comment'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

call plug#end()

" map leader to space
let mapleader=" "

" turn off hightlight search
set nohlsearch

" use system clipboard
set clipboard=unnamed

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" remap yank all line
nnoremap Y Y

" by default, the indent is 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

" default spacing
autocmd Filetype vue setlocal ts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 expandtab

:lua require('mylspconfig')
:lua require('mynvim_comment')
:lua require('mytreesitter')
:lua require('mydevicons')
:lua require('mytelescope')
