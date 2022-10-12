local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")
local opts = { noremap=true, silent=true }

telescope.setup {
  defaults = {
    file_ignore_patterns = {
      "node_modules",
      ".git",
    }
  },
  pickers = {
    live_grep = {
      additional_args = function(opts)
        return {"--hidden"}
      end
    },
    buffers = {
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["<C-d>"] = actions.delete_buffer,
        },
      }
    }
  },
}

vim.keymap.set('n', '<leader>ff', function() require("telescope.builtin").find_files({ hidden = true }) end, opts)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, opts)
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, opts)
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, opts)

