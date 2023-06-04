-- Leader - set before lazy
vim.g.mapleader = '\\'

-- Setup Lazy plugin manager
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

local lazyOpts = {
  lazy = true,
  checker = {
    enabled = false,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "netrwPlugin",
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

require("lazy").setup("plugins", lazyOpts)
require("core")
require("languages/go")
require("lsp")
require("navigation")
require("session")
require("statusbar")
require("terminal")
require("theme")
require("treesitter")
require("winbar")
