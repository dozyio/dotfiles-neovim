return {
  { "echasnovski/mini.pairs", enabled = false },
  { "echasnovski/mini.ai", enabled = false },
  { "folke/flash.nvim", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      zen = { enabled = false },
      dim = { enabled = false },
      image = { enabled = false },
      words = { enabled = false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-c>"] = { "cancel", "fallback" },
        ["<esc>"] = { "cancel", "fallback" },
      },
    },
  },
  -- {
  --   "stevearc/conform.nvim",
  --   keys = {
  --     {
  --       "<leader>p",
  --       function()
  --         require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
  --       end,
  --       mode = { "n", "v" },
  --       desc = "Format Injected Langs",
  --     },
  --   },
  -- },
}
