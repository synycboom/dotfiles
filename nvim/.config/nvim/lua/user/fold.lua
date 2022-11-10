local vim = vim
local api = vim.api
local M = {}

function M.nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    api.nvim_command('augroup '..group_name)
    api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      api.nvim_command(command)
    end

    api.nvim_command('augroup END')
  end
end


local autoCommands = {
  open_folds = {
    {"BufReadPost,FileReadPost", "*", "normal zR"} -- open all folds when reading a buffer
  }
}

M.nvim_create_augroups(autoCommands)

