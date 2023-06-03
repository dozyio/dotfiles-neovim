vim.keymap.set("n", "<leader>qs", [[<cmd>lua require("persistence").load()<CR>]], { desc = "Restore session for current dir" })
vim.keymap.set("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<CR>]], { desc = "Restore last session" })
vim.keymap.set("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], { desc = "Stop session" })
