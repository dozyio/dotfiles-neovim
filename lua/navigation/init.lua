-- nvim-tree
require("nvim-tree").setup({
  filters = { custom = { "^.git$" } }
})

-- Actions
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>")
vim.keymap.set("n", "<C-Left>", ":bprevious<CR>", { noremap = true, nowait = true, silent = true })
vim.keymap.set("n", "<C-Right>", ":bnext<CR>", { noremap = true, nowait = true, silent = true })

-- Which Key
local wk = require("which-key")
wk.register({
  ["<leader>"] = {
    n = {
      name = "nvim-tree",
      n = "nvim-tree"
    },
  },
})

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
