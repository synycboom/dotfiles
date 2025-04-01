local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok then
	return
end

mason.setup()

local lspconfig = require("lspconfig")

-- NOTE: these server might have to be installed manually when using nvm to switch versions
-- For example, node v10.24.1 has to be together with npm install -g typescript-language-server@0.1.14
local servers = {
  "jsonls",
  -- "sumneko_lua",
  -- "vuels",
  "volar",
  "gopls",
  "ts_ls",
  "pyright",
--   "metals",
  "kotlin_language_server",
}

mason_lspconfig.setup({
	ensure_installed = servers,
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	local has_custom_opts, server_custom_opts = pcall(require, "user.lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end

	lspconfig[server].setup(opts)
end

