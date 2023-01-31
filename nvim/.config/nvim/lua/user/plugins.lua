local Plug = require "user.vimplug"

Plug.begin()

Plug("junegunn/fzf", {
  dir = "~/.fzf",
  run = "./install --all",
})
Plug("junegunn/fzf.vim")
Plug("nvim-lua/plenary.nvim")
Plug("kyazdani42/nvim-web-devicons")
Plug("kyazdani42/nvim-tree.lua")
Plug("numToStr/Comment.nvim")
Plug("akinsho/bufferline.nvim", { tag = "v2.*" })
Plug("pineapplegiant/spaceduck", { branch = "main" })
Plug("nvim-lualine/lualine.nvim")
Plug("JoosepAlviste/nvim-ts-context-commentstring")

-- cmp plugins
Plug("hrsh7th/nvim-cmp") -- The completion plugin
Plug("hrsh7th/cmp-buffer") -- buffer completions
Plug("hrsh7th/cmp-path") -- path completions
Plug("saadparwaiz1/cmp_luasnip")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-nvim-lua")

-- snippets
Plug("L3MON4D3/LuaSnip") --snippet engine
Plug("rafamadriz/friendly-snippets") -- a bunch of snippets to use

-- LSP
Plug("williamboman/nvim-lsp-installer") -- simple to use language server installer
Plug("neovim/nvim-lspconfig") -- enable LSP
Plug("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

Plug("posva/vim-vue")

-- Telescope
Plug("nvim-telescope/telescope.nvim", { tag = "0.1.0" })

-- Treesitter
Plug("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate"})

-- Navigator
Plug("christoomey/vim-tmux-navigator") -- vim-tmux navigator
Plug("tpope/vim-repeat")
Plug("ggandor/leap.nvim")

-- Comand Preview
Plug("smjonas/live-command.nvim")

-- Git
Plug("tpope/vim-fugitive")
Plug("lewis6991/gitsigns.nvim")

-- Languages Support
Plug("earthly/earthly.vim", { branch = "main" })

Plug.ends()

