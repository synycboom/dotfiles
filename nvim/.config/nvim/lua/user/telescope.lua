local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local opts = { noremap=true, silent=true }

telescope.setup {
	defaults = {
		file_ignore_patterns = {
			"node_modules",
			".git",
		}
	}
}

local original_find_files = require("telescope.builtin").find_files
local find_files = function()
	original_find_files({ hidden = true })
end

vim.keymap.set('n', '<leader>ff', find_files, opts)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, opts)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, opts)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, opts)

