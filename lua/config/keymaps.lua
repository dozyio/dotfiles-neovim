-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Remove lazy keymaps

-- Buffer navigation
vim.keymap.del("n", "<c-Left>")
vim.keymap.set(
  "n",
  "<c-Left>",
  ":bprevious<CR>",
  { noremap = true, nowait = true, silent = true, desc = "Previous buffer" }
)

vim.keymap.del("n", "<c-Right>")
vim.keymap.set("n", "<c-Right>", ":bnext<CR>", { noremap = true, nowait = true, silent = true, desc = "Next buffer" })

-- Diagnostic navigation
vim.keymap.del("n", "<c-Up>")
vim.keymap.set("n", "<c-Up>", function()
  vim.diagnostic.jump({ count = -1, float = true })
  vim.cmd("normal! zz")
end, { noremap = true, nowait = true, silent = true })

vim.keymap.del("n", "<c-Down>")
vim.keymap.set("n", "<c-Down>", function()
  vim.diagnostic.jump({ count = 1, float = true })
  vim.cmd("normal! zz")
end, { noremap = true, nowait = true, silent = true })

-- Copy & Paste
vim.keymap.set("v", "y", "ygv<esc>", { desc = "Keep end position after yank" })

vim.keymap.set(
  "n",
  "<leader>y",
  ":%y+<cr>",
  { noremap = true, nowait = true, silent = true, desc = "Copy file to system buffer" }
)

vim.keymap.set(
  "n",
  "<leader>c",
  'V"+y',
  { noremap = true, nowait = true, silent = true, desc = "Copy current line to system buffer" }
)

vim.keymap.set(
  "v",
  "<leader>c",
  '"+y',
  { noremap = true, nowait = true, silent = true, desc = "Copy selected to system buffer" }
)

-- Delete
-- delete current line, don't save to register
vim.keymap.set("n", "<leader>d", 'V"_d', { noremap = true, nowait = true, silent = true, desc = "Delete current line" })
-- delete selection, don't save to register
vim.keymap.set(
  "v",
  "<leader>d",
  '"_d',
  { noremap = true, nowait = true, silent = true, desc = "Delete current selection" }
)

-- additional undo breakpoints
vim.keymap.set("i", ",", ",<c-g>u", { noremap = true, nowait = true, silent = true })
vim.keymap.set("i", ".", ".<c-g>u", { noremap = true, nowait = true, silent = true })
vim.keymap.set("i", "!", "!<c-g>u", { noremap = true, nowait = true, silent = true })
vim.keymap.set("i", "?", "?<c-g>u", { noremap = true, nowait = true, silent = true })
vim.keymap.set("i", "{", "{<c-g>u", { noremap = true, nowait = true, silent = true })
vim.keymap.set("i", "}", "}<c-g>u", { noremap = true, nowait = true, silent = true })
vim.keymap.set("i", "(", "(<c-g>u", { noremap = true, nowait = true, silent = true })
vim.keymap.set("i", ")", ")<c-g>u", { noremap = true, nowait = true, silent = true })
vim.keymap.set("i", "[", "[<c-g>u", { noremap = true, nowait = true, silent = true })
vim.keymap.set("i", "]", "]<c-g>u", { noremap = true, nowait = true, silent = true })

-- Search
-- vim.keymap.del("n", "<leader>s")
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g", { desc = "Search and replace current word" })
-- vim.keymap.del("n", "<leader><space>")
vim.keymap.set("n", "<leader><leader>", ":nohlsearch<CR>", { desc = "Remove highlighting" })
-- keep cursor centered when searching
-- vim.keymap.del("n", "n")
vim.keymap.set("n", "n", "nzzzv", { noremap = true, nowait = true, silent = true })
-- vim.keymap.del("n", "N")
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, nowait = true, silent = true })

-- move to start/end of line
-- vim.keymap.del("c", "<c-a>")
vim.keymap.set("c", "<c-a>", "<home>", { desc = "Jump to start of command" })
-- vim.keymap.del("c", "<c-e>")
vim.keymap.set("c", "<c-e>", "<end>", { desc = "Jump to end of command" })

-- Json
vim.keymap.set("n", "<leader>jp", ":%!jq .<CR>", { noremap = true, silent = true, desc = "Pretty print json" })
vim.keymap.set("n", "<leader>jc", ":%!jq -c .<CR>", { noremap = true, silent = true, desc = "Compact json" })

-- Close buffer
vim.keymap.set("n", "<c-x>", ":bdelete<CR>", { noremap = true, silent = true, desc = "Close current buffer" })
--vim.keymap.set("n", "<c-X>", ":bd!<CR>", { noremap = true, silent = true, desc = "Close current buffer" })
vim.keymap.set("n", "<c-l>", ":cclose<CR>", { noremap = true, silent = true, desc = "Close quickfix window" })
-- Misc
-- map ctrl-c to escape in various modes, stops few messages from appearing
vim.keymap.set({ "i", "n", "v" }, "<c-c>", "<esc>", { noremap = true, silent = true, desc = "Exit insert mode" })

-- redraw and restart treesitter
vim.keymap.set(
  "n",
  "<leader>tt",
  ":mod<CR>:lua vim.treesitter.stop()<CR>:lua vim.treesitter.start()<CR>",
  { noremap = true, silent = true, desc = "Restart Treesitter" }
)

vim.keymap.set("n", "<leader>f", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "<leader>p", ":LazyFormat<CR>", { desc = "Format" })
vim.keymap.set("n", "gX", vim.lsp.buf.rename, { desc = "LSP Rename" })
