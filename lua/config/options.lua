local opt = vim.opt
vim.g.mapleader = "\\"
vim.g.snacks_animate = false
opt.cursorline = false
opt.mouse = "v"
opt.wrap = true
opt.ruler = true
opt.scrolloff = 8
opt.clipboard = ""

-- Cursor
-- block cursor in insert mode
vim.o.guicursor = ""

-- Columns
vim.o.colorcolumn = "80,120"

-- Navigation
vim.cmd("set nostartofline")

-- Text
vim.cmd([[autocmd BufEnter * set formatoptions+=j]]) -- better joins with comments
vim.cmd([[autocmd BufEnter * set formatoptions-=cro]]) -- no continuation of comments

-- ignore editorconfig
vim.g.editorconfig = false

-- Window Title
vim.o.title = true
vim.o.titlestring = "%<%F - NVIM"

-- Prettier
vim.g.lazyvim_prettier_needs_config = true

-- Conceal
vim.wo.conceallevel = 0

-- Don't show quickfix window in buffer list
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

-- Close quickfix window on exit
vim.api.nvim_create_autocmd("QuitPre", {
  callback = function()
    vim.cmd("cclose")
  end,
})
