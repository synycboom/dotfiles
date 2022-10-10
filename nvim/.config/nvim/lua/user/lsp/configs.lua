local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

-- NOTE: these server might have to be installed manually when using nvm to switch versions
-- For example, node v10.24.1 has to be together with npm install -g typescript-language-server@0.1.14
local servers = {
  "jsonls",
  -- "sumneko_lua",
  "vuels",
  "gopls",
  "tsserver",
  "pyright",
}

lsp_installer.setup({
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

