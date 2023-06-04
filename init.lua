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
  -- Libs
  "nvim-lua/plenary.nvim",
  "nvim-lua/popup.nvim",
  "MunifTanjim/nui.nvim",

  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1,
  },

  -- Icons
  "kyazdani42/nvim-web-devicons",

  -- Treesitter
  "nvim-treesitter/nvim-treesitter",
  "HiPhish/nvim-ts-rainbow2",
  { "nvim-treesitter/playground", event = "VeryLazy", },

  -- Git
  "lewis6991/gitsigns.nvim",
  "rhysd/committia.vim",
  {
    "kdheepak/lazygit.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Navigation
  { "kyazdani42/nvim-tree.lua", event = "VeryLazy", },
  { "nvim-telescope/telescope.nvim", event = "VeryLazy", },
  { "nvim-telescope/telescope-fzy-native.nvim", event = "VeryLazy", },
  { "ethanholz/nvim-lastplace", },

  -- Winbar / Buffers
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "catppuccin/nvim",
    },
  },

  -- Status bar
  "arkav/lualine-lsp-progress",
  "nvim-lualine/lualine.nvim",

  -- Comments
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = true
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

  -- Sessions
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {}
  },

  -- Context
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    opts = {},
  },

  -- Indent
  "lukas-reineke/indent-blankline.nvim",

  -- Terminal
  "akinsho/toggleterm.nvim",

  -- Debugging
  "ray-x/guihua.lua",

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v2.x",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      {
        "williamboman/mason.nvim",
        build = function() pcall(vim.cmd, "MasonUpdate") end,
      },
      { "williamboman/mason-lspconfig.nvim" },
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "L3MON4D3/LuaSnip" },
      { "saadparwaiz1/cmp_luasnip" },
      -- Copilot
      {
        "zbirenbaum/copilot.lua",
        opts = {
          suggestion = { enabled = false },
          panel = { enabled = false },
        },
      },
      {
        "zbirenbaum/copilot-cmp",
        event = { "InsertEnter", "LspAttach" },
        config = true
      },
    }
  },

  -- Quickfix
  "kevinhwang91/nvim-bqf",

  -- Languages
  -- go
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()' -- installs binaries
  },
  -- markdown
  { "iamcco/markdown-preview.nvim", build = ":call mkdp#util#install()" },
})

require("core")
require("git")
require("indent")
require("languages/go")
require("lsp")
require("navigation")
require("session")
require("statusbar")
require("terminal")
require("theme")
require("treesitter")
require("winbar")
