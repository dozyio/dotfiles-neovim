vim.g.mapleader = '\\'

-- Setup Lazy package manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Plugin
require("lazy").setup({
  -- Theme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  -- Icons
  {
    "kyazdani42/nvim-web-devicons",
  },

  -- Treesitter
  "nvim-treesitter/nvim-treesitter",
  "HiPhish/nvim-ts-rainbow2",

  -- Git
  "lewis6991/gitsigns.nvim",
  "rhysd/committia.vim",
  "tpope/vim-fugitive",

  -- Navigation
  "nvim-neo-tree/neo-tree.nvim",

  -- Utils
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },
  "nvim-lua/plenary.nvim",
  "MunifTanjim/nui.nvim",
})

-- Mouse
vim.opt.mouse = ""

-- Tabs
vim.opt.tabstop = 2
vim.opt.softtabstop = 0
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Indenting
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Line Numbering
vim.opt.relativenumber = true
vim.opt.number = true
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
vim.opt.spell = false

-- Window
vim.opt.title = true

-- Files
vim.opt.fileformats = "unix"

-- Misc
-- disable inline vim commands in files
vim.opt.modelines = 0
-- for status bars
vim.opt.winminheight = 0
-- save previous commands, history etc
vim.opt.shada = "!,'100,<100,:100,s10,%,h" -- see :h 'shada'

-- Undo
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
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
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- keep cursor centered when searching
vim.keymap.set("n", "n", "nzzzv", { noremap = true, nowait = true, silent = true })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, nowait = true, silent = true })
-- search and replace current word
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/")

require("lua/git/init")
require("lua/theme/init")
require("lua/treesitter/init")
require("lua/navigation/init")
