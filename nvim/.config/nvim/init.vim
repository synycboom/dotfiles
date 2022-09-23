call plug#begin()

" color scheme
" Plug 'flazz/vim-colorschemes'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
" buffer line
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
" status line
Plug 'nvim-lualine/lualine.nvim'
" fzf search integration
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" vue integration 
Plug 'posva/vim-vue'
" lsp configuration
Plug 'neovim/nvim-lspconfig'
" comment
Plug 'numToStr/Comment.nvim'
" nvim lua function utilities
Plug 'nvim-lua/plenary.nvim'
" icons
Plug 'kyazdani42/nvim-web-devicons'
" syntax highlight
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" search popup
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

call plug#end()

" map leader to space
let mapleader=" "
" turn on incremental search (go to the search position while searching)
set incsearch
" turn off hightlight search
set nohlsearch
" use system clipboard
set clipboard=unnamed
" use smart case
set ignorecase
set smartcase
" turn hybrid line numbers on
set number relativenumber
set nu rnu
" disable swap and backup file
set noswapfile
set nobackup
" start scrolling 8 lines ahead
set scrolloff=8
" set default split position to right/below
set splitright
set splitbelow
" by default, the indent is 2 spaces
set shiftwidth=2
set softtabstop=2
set tabstop=2

" theme setup
colorscheme spaceduck

" set termguicolors
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
	set termguicolors
endif

" remap yank all line
nnoremap Y Y

" default spacing
autocmd Filetype vue setlocal ts=2 sw=2 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 expandtab

:lua require('lspconfig_config')
:lua require('treesitter_config')
:lua require('devicons_config')
:lua require('telescope_config')
:lua require('bufferline_config')
:lua require('comment_config')
:lua require('lualine_config')
