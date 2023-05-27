vim.g.mapleader = "\\"

-- Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

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

  -- Utils
  "folke/which-key.nvim",
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

-- Git
require('gitsigns').setup()

-- Theme
require("theme")

-- Treesitter
require("treesitter")
