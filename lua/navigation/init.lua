-- Nvim-Tree
require("nvim-tree").setup({
  filters = { custom = { "^.git$" } }
})

-- Actions
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "NvimTree toggle" })
vim.keymap.set("n", "<c-Left>", ":bprevious<CR>", { noremap = true, nowait = true, silent = true, desc = "Previous buffer" })
vim.keymap.set("n", "<c-Right>", ":bnext<CR>", { noremap = true, nowait = true, silent = true, desc = "Next buffer" })
vim.keymap.set("n", "<Tab>", "<c-w>w", { desc = "Next window" })
vim.keymap.set("n", "<S-Tab>", "<c-w>W", { desc = "Previous window" })

-- Close if nvim-tree is last buffer
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    local invalid_win = {}
    local wins = vim.api.nvim_list_wins()
    for _, w in ipairs(wins) do
      local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
      if bufname:match("NvimTree_") ~= nil then
        table.insert(invalid_win, w)
      end
    end
    if #invalid_win == #wins - 1 then
      -- Should quit, so we close all invalid windows.
      for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
    end
  end
})

-- Telescope
local sorters = require("telescope.sorters")
local previewers = require("telescope.previewers")
local actions = require("telescope.actions")
local builtin = require('telescope.builtin')

require("telescope").setup({
  defaults = {
    file_sorter = sorters.get_fzy_sorter,
    prompt_prefix = " >",
    color_devicons = true,

    file_previewer = previewers.vim_buffer_cat.new,
    grep_previewer = previewers.vim_buffer_vimgrep.new,
    qflist_previewer = previewers.vim_buffer_qflist.new,

    mappings = {
      i = {
        ["esc>"] = actions.close,
        ["<c-x>"] = actions.close,
        ["<c-q>"] = actions.send_to_qflist + actions.open_qflist,
      },
    },
    file_ignore_patterns = { "^.git/.*", },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
  pickers = {
    find_files = {
      hidden = true,
    },
  },
})

require("telescope").load_extension("fzy_native")

-- Actions
vim.keymap.set('n', '<c-p>', builtin.find_files, { noremap = true, nowait = true, silent = true, desc = "Find files" })
vim.keymap.set('n', '<c-g>', builtin.live_grep, { noremap = true, nowait = true, silent = true, desc = "Grep" })
vim.keymap.set('n', '<c-t>', builtin.resume, { noremap = true, nowait = true, silent = true, desc = "Resume Telescope" })

-- Nvim-Lastplace
require("nvim-lastplace").setup({
  lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
  lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
  lastplace_open_folds = true
})
