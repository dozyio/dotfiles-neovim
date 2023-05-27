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

  -- Utils
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  }
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

-- Git
require("git")

-- Theme
require("theme")

-- Treesitter
require("treesitter")
