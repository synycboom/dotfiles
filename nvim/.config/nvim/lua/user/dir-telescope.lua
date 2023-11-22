local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local status_ok, dir_telescope = pcall(require, "dir-telescope")
if not status_ok then
  return
end

dir_telescope.setup({
  hidden = true,
  no_ignore = false,
  show_preview = true,
})


telescope.load_extension("dir")

vim.keymap.set("n", "<leader>fd", "<cmd>Telescope dir live_grep<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>pd", "<cmd>Telescope dir find_files<CR>", { noremap = true, silent = true })
