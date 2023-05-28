-- Leader
vim.g.mapleader = '\\'

-- Tabs
vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.smarttab = true

-- Indenting
vim.o.autoindent = true
vim.o.smartindent = true

-- Line Numbering
vim.o.relativenumber = true
vim.o.number = true
vim.keymap.set("n", "<C-n>", ":set invrelativenumber<CR>")

-- Text
vim.cmd([[autocmd BufEnter * set formatoptions+=j]]) -- better joins with comments
vim.cmd([[autocmd BufEnter * set formatoptions-=cro]]) -- don't continue comments on next line

-- Copy & Paste
 -- copy file to system buffer
vim.keymap.set("n", "<leader>y", ":%y+<cr>", { noremap = true, nowait = true, silent = true })
 -- copy selection to system buffer
vim.keymap.set("v", "<leader>c", "\"+y+<cr>", { noremap = true, nowait = true, silent = true })

-- Delete
-- delete current line, don't save to register
vim.keymap.set("n", "<leader>d", "V\"_d", { noremap = true, nowait = true, silent = true })
-- delete selection, don't save to register
vim.keymap.set("v", "<leader>d", "\"_d", { noremap = true, nowait = true, silent = true })

-- Spelling
vim.o.spell = false

-- Window
vim.o.title = true

-- Files
vim.o.fileformats = "unix"

-- Project specific config files
-- execute .nvimrc files in current dir
vim.o.exrc = true

-- Undo
vim.o.undofile = true
vim.o.undolevels = 1000
vim.o.undoreload = 10000
vim.o.undodir = os.getenv('HOME') .. "/.local/state/nvim/undo/"
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
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.showmatch = true
vim.o.ignorecase = true
vim.o.smartcase = true
-- keep cursor centered when searching
vim.keymap.set("n", "n", "nzzzv", { noremap = true, nowait = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, nowait = true, silent = true })
-- search and replace current word
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/")
vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>")

-- Scrolling
vim.o.scrolloff = 8
vim.o.sidescrolloff = 5

-- Visual move
vim.keymap.set("v", "J", "nzzzv", { noremap = true, nowait = true, silent = true })
vim.keymap.set("v", "K", "Nzzzv", { noremap = true, nowait = true, silent = true })

-- Spacing
vim.o.listchars = ""
vim.o.list = false
-- vim.cmd("let c_space_errors 1")

-- Cursor
-- block cursor in insert mode
vim.o.guicursor = ""

-- Columns
vim.o.colorcolumn = "80,120"

-- Navigation
vim.cmd("set nostartofline")
-- move to start/end of line 
vim.keymap.set("c", "<c-a>", "<home>")
vim.keymap.set("c", "<c-e>", "<end>")

-- Buffer
vim.keymap.set("n", "<c-x>", ":bd<CR>", { noremap = true, silent = true })

-- Mouse
vim.o.mouse = ""

-- Misc
-- disable inline vim commands in files
vim.o.modelines = 0
-- for status bars
vim.o.winminheight = 0
-- save previous commands, history etc
vim.o.shada = "!,'100,<100,:100,s10,%,h" -- see :h 'shada'
