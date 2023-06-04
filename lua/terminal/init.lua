function _G.set_terminal_keymaps()
  vim.keymap.set('t', '<esc>', [[<c-\><c-n>]], { buffer = 0, desc = "Normal mode" })
  vim.keymap.set('t', '<c-w>', [[<c-\><c-n><c-w>]], { buffer = 0, desc = "Change window" })
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.keymap.set('n', '<F12>', ":ToggleTerm<CR>", { desc = "Toggle terminal" })
vim.keymap.set('t', '<F12>', "<c-\\><c-n> :ToggleTerm<CR>", { desc = "Toggle terminal" })
