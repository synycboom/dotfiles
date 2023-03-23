local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {
  ensure_installed = { "go", "python", "typescript", "javascript", "vue" },
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        ["ia"] = "@assignment.inner",
        ["aa"] = "@assignment.outer",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer",
        ["il"] = "@call.inner",
        ["al"] = "@call.outer",
        ["ic"] = "@class.inner",
        ["ac"] = "@class.outer",
        ["ii"] = "@conditional.inner",
        ["ai"] = "@conditional.outer",
        ["im"] = "@function.inner",
        ["am"] = "@function.outer",
        ["io"] = "@loop.inner",
        ["ao"] = "@loop.outer",
        ["in"] = "@parameter.inner",
        ["an"] = "@parameter.outer",
        ["ir"] = "@return.inner",
        ["ar"] = "@return.outer",
        ["aj"] = "@statement.outer",
        ["ak"] = "@scopename.inner",
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      --[[ selection_modes = { ]]
      --[[   ['@parameter.outer'] = 'v', -- charwise ]]
      --[[   ['@function.outer'] = 'V', -- linewise ]]
      --[[   ['@class.outer'] = '<c-v>', -- blockwise ]]
      --[[ }, ]]

      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true of false
      include_surrounding_whitespace = false,
    },
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]a"] = { query = { "@assignment.outer", "@assignment.inner" } },
        ["]b"] = { query = { "@block.outer", "@block.inner" } },
        ["]l"] = { query = { "@call.outer", "@call.inner" } },
        ["]c"] = { query = { "@class.outer", "@class.inner" } },
        ["]i"] = { query = { "@conditional.outer", "@conditional.inner" } },
        ["]m"] = { query = { "@function.outer", "@function.inner" } },
        ["]o"] = { query = { "@loop.outer", "@loop.inner" } },
        ["]n"] = { query = { "@parameter.outer", "@parameter.inner" } },
        ["]r"] = { query = { "@return.outer", "@return.inner" } },
        ["]j"] = { query = { "@statement.outer", "@statement.inner" } },
        ["]k"] = { query = { "@scopename.outer", "@scopename.inner" } },
        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_next_end = {
        ["]A"] = { query = { "@assignment.outer", "@assignment.inner" } },
        ["]B"] = { query = { "@block.outer", "@block.inner" } },
        ["]L"] = { query = { "@call.outer", "@call.inner" } },
        ["]C"] = { query = { "@class.outer", "@class.inner" } },
        ["]I"] = { query = { "@conditional.outer", "@conditional.inner" } },
        ["]M"] = { query = { "@function.outer", "@function.inner" } },
        ["]O"] = { query = { "@loop.outer", "@loop.inner" } },
        ["]N"] = { query = { "@parameter.outer", "@parameter.inner" } },
        ["]R"] = { query = { "@return.outer", "@return.inner" } },
        ["]J"] = { query = { "@statement.outer", "@statement.inner" } },
        ["]K"] = { query = { "@scopename.outer", "@scopename.inner" } },
        ["]Z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_previous_start = {
        ["[a"] = { query = { "@assignment.outer", "@assignment.inner" } },
        ["[b"] = { query = { "@block.outer", "@block.inner" } },
        ["[l"] = { query = { "@call.outer", "@call.inner" } },
        ["[c"] = { query = { "@class.outer", "@class.inner" } },
        ["[i"] = { query = { "@conditional.outer", "@conditional.inner" } },
        ["[m"] = { query = { "@function.outer", "@function.inner" } },
        ["[o"] = { query = { "@loop.outer", "@loop.inner" } },
        ["[n"] = { query = { "@parameter.outer", "@parameter.inner" } },
        ["[r"] = { query = { "@return.outer", "@return.inner" } },
        ["[j"] = { query = { "@statement.outer", "@statement.inner" } },
        ["[k"] = { query = { "@scopename.outer", "@scopename.inner" } },
        ["[z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      goto_previous_end = {
        ["[A"] = { query = { "@assignment.outer", "@assignment.inner" } },
        ["[B"] = { query = { "@block.outer", "@block.inner" } },
        ["[L"] = { query = { "@call.outer", "@call.inner" } },
        ["[C"] = { query = { "@class.outer", "@class.inner" } },
        ["[I"] = { query = { "@conditional.outer", "@conditional.inner" } },
        ["[M"] = { query = { "@function.outer", "@function.inner" } },
        ["[O"] = { query = { "@loop.outer", "@loop.inner" } },
        ["[N"] = { query = { "@parameter.outer", "@parameter.inner" } },
        ["[R"] = { query = { "@return.outer", "@return.inner" } },
        ["[J"] = { query = { "@statement.outer", "@statement.inner" } },
        ["[K"] = { query = { "@scopename.outer", "@scopename.inner" } },
        ["[Z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
      },
      -- Below will go to either the start or the end, whichever is closer.
      -- Use if you want more granular movements
      -- Make it even more gradual by adding multiple queries and regex.
      goto_next = {
      },
      goto_previous = {
      }
    },
  },
}

local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
-- example: make gitsigns.nvim movement repeatable with ; and , keys.
local gs = require("gitsigns")

-- make sure forward function comes first
local next_hunk_repeat, prev_hunk_repeat = ts_repeat_move.make_repeatable_move_pair(gs.next_hunk, gs.prev_hunk)
-- Or, use `make_repeatable_move` or `set_last_move` functions for more control. See the code for instructions.

vim.keymap.set({ "n", "x", "o" }, "]h", next_hunk_repeat)
vim.keymap.set({ "n", "x", "o" }, "[h", prev_hunk_repeat)

