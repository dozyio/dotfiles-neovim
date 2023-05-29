require("toggleterm").setup({})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.keymap.set('n', '<F12>', ":ToggleTerm<CR>")
vim.keymap.set('t', '<F12>', "<C-\\><C-n> :ToggleTerm<CR>")
