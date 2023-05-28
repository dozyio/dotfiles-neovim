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

-- Plugins
require("lazy").setup({
  -- Theme
  { "catppuccin/nvim", name = "catppuccin" },

  -- Icons
  {
    "kyazdani42/nvim-web-devicons",
  },

  -- Treesitter
  "nvim-treesitter/nvim-treesitter",
  { "nvim-treesitter/playground", event = "VeryLazy", },
  "HiPhish/nvim-ts-rainbow2",

  -- Git
  "lewis6991/gitsigns.nvim",
  "rhysd/committia.vim",

  -- Navigation
  { "kyazdani42/nvim-tree.lua", event = "VeryLazy", },
  { "nvim-telescope/telescope.nvim", event = "VeryLazy", },
  { "nvim-telescope/telescope-fzy-native.nvim", event = "VeryLazy", },
  { "ethanholz/nvim-lastplace", },

  -- Winbar & Buffers
  { "akinsho/bufferline.nvim",
    after = "catppuccin",
    config = function()
      require("bufferline").setup {
        highlights = require("catppuccin.groups.integrations.bufferline").get()
      }
    end
  },

  -- Status bar
  { "nvim-lualine/lualine.nvim", },

  -- Comments
  { "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function() require('Comment').setup() end
  },

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

  -- Libs
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "MunifTanjim/nui.nvim",

  -- Debugging
  "ray-x/guihua.lua",

  -- LSP
  "neovim/nvim-lspconfig",

  -- Languages
  -- go
  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },
  -- markdown
  { "iamcco/markdown-preview.nvim", build = ":call mkdp#util#install()" },

})

require("core")
require("git")
require("navigation")
require("statusbar")
require("theme")
require("treesitter")
require("winbar")
