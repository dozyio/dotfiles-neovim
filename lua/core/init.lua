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

-- Text
vim.cmd([[autocmd BufEnter * set formatoptions+=j]])   -- better joins with comments
vim.cmd([[autocmd BufEnter * set formatoptions-=cro]]) -- no continuation of comments

-- Copy & Paste
vim.keymap.set("v", "y", "ygv<esc>", { desc = "Keep end position after yank" })
vim.keymap.set("n", "<leader>y", ":%y+<cr>",
  { noremap = true, nowait = true, silent = true, desc = "Copy file to system buffer" })
vim.keymap.set("n", "<leader>c", "V\"+y",
  { noremap = true, nowait = true, silent = true, desc = "Copy current line to system buffer" })
vim.keymap.set("v", "<leader>c", "\"+y",
  { noremap = true, nowait = true, silent = true, desc = "Copy selected to system buffer" })

-- Delete
-- delete current line, don't save to register
vim.keymap.set("n", "<leader>d", "V\"_d", { noremap = true, nowait = true, silent = true, desc = "Delete current line" })
-- delete selection, don't save to register
vim.keymap.set("v", "<leader>d", "\"_d",
  { noremap = true, nowait = true, silent = true, desc = "Delete current selection" })

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
vim.keymap.set("n", "U", "<C-r>", { desc = "Redo" })
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
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/g", { desc = "Search and replace current word" })
vim.keymap.set("n", "<leader><space>", ":nohlsearch<CR>", { desc = "Remove highlighting" })
-- keep cursor centered when searching
vim.keymap.set("n", "n", "nzzzv", { noremap = true, nowait = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, nowait = true, silent = true })

-- Visual move
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",
  { noremap = true, nowait = true, silent = true, desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, nowait = true, silent = true, desc = "Move selection up" })

-- Scrolling
vim.o.scrolloff = 8
vim.o.sidescrolloff = 5

-- Spacing
vim.o.listchars = ""
vim.o.list = false

-- Cursor
-- block cursor in insert mode
vim.o.guicursor = ""

-- Columns
vim.o.colorcolumn = "80,120"

-- Navigation
vim.cmd("set nostartofline")
-- move to start/end of line
vim.keymap.set("c", "<c-a>", "<home>", { desc = "Jump to start of command" })
vim.keymap.set("c", "<c-e>", "<end>", { desc = "Jump to end of command" })

-- Buffer
vim.keymap.set("n", "<c-x>", ":Bdelete<CR>", { noremap = true, silent = true, desc = "Close current buffer" })
--vim.keymap.set("n", "<c-X>", ":bd!<CR>", { noremap = true, silent = true, desc = "Close current buffer" })
vim.keymap.set("n", "<c-l>", ":cclose<CR>", { noremap = true, silent = true, desc = "Close quickfix window" })
vim.keymap.set("n", "<c-;>", ":cclose<CR>:NvimTreeClose<CR>:TroubleClose<CR>",
  { noremap = true, silent = true, desc = "Close windows (quickfix, nvimtree, trouble)" })

-- Mouse
vim.o.mouse = "v"

-- Highlight
-- trailing spaces
vim.cmd("match errorMsg '/\\s\\+$/'")

-- Misc
-- disable inline vim commands in files
vim.o.modelines = 0
-- for status bars
vim.o.winminheight = 0
-- save previous commands, history etc
vim.o.shada = "!,'100,<100,:100,s10,%,h" -- see :h 'shada'
-- map ctrl-c to escape in insert mode, stops lsp from erroring
vim.keymap.set({ "i", "n", "v" }, "<c-c>", "<esc>", { noremap = true, silent = true, desc = "Exit insert mode" })
-- ignore editorconfig
vim.g.editorconfig = false

-- Json
vim.keymap.set("n", "<leader>jp", ":%!jq .<CR>", { noremap = true, silent = true, desc = "Pretty print json" })
vim.keymap.set("n", "<leader>jc", ":%!jq -c .<CR>", { noremap = true, silent = true, desc = "Compact json" })

-- Save window position when switching buffers
-- save position
_G.buffer_views = {}
vim.api.nvim_create_autocmd("BufLeave", {
  callback = function()
    -- Exclude NvimTree from saving positions
    if vim.bo.filetype ~= "NvimTree" then
      local bufid = vim.fn.bufnr('%')
      _G.buffer_views[bufid] = vim.fn.winsaveview()
    end
  end
})
-- restore position
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local bufid = vim.fn.bufnr('%')
    if _G.buffer_views[bufid] then
      vim.fn.winrestview(_G.buffer_views[bufid])
    end
  end
})

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
  end
})
