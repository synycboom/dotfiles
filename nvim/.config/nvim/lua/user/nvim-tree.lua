local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  return
end

-- disable netrw
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvim_tree.setup {
  -- update_focused_file = {
  --   enable = true,
  --   update_cwd = true,
  -- },
  -- renderer = {
  --   root_folder_modifier = ":t",
  --   icons = {
  --     glyphs = {
  --       default = "",
  --       symlink = "",
  --       folder = {
  --         arrow_open = "",
  --         arrow_closed = "",
  --         default = "",
  --         open = "",
  --         empty = "",
  --         empty_open = "",
  --         symlink = "",
  --         symlink_open = "",
  --       },
  --       git = {
  --         unstaged = "",
  --         staged = "S",
  --         unmerged = "",
  --         renamed = "➜",
  --         untracked = "U",
  --         deleted = "",
  --         ignored = "◌",
  --       },
  --     },
  --   },
  -- },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  view = {
    width = 30,
    side = "left",
  },
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<leader>t", ":NvimTreeToggle <CR>", opts)

