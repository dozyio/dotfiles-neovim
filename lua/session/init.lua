vim.keymap.set("n", "<leader>qs", [[<cmd>lua require("persistence").load()<CR>]], {})
vim.keymap.set("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<CR>]], {})
vim.keymap.set("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], {})

-- Which Key
local wk = require("which-key")
wk.register({
  ["<leader>qs"] = { "Restore session for pwd" },
  ["<leader>ql"] = { "Restore last session" },
  ["<leader>qd"] = { "Stop session" },
})
