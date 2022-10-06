local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require("bufferline").setup {
	options = {
		mode = "tabs",
		show_buffer_close_icons = false,
		show_close_icon = false,
		separator_style = {'',''},
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
			}
		}
	}	
}

-- Navigate to previous/next
map('n', '<A-,>', '<Cmd>BufferLineCyclePrev<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferLineCycleNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferLineMovePrev<CR>', opts)
map('n', '<A->>', '<Cmd>BufferLineMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLineGoToBuffer -1<CR>', opts)
-- Pick buffer
map('n', '<A-p>', '<Cmd>BufferLinePick<CR>', opts)

