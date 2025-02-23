return {
  { "echasnovski/mini.pairs", enabled = false },
  { "echasnovski/mini.ai", enabled = false },
  { "folke/flash.nvim", enabled = false },
  {
    "folke/snacks.nvim",
    opts = {
      zen = { enabled = false },
      dim = { enabled = false },
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
        preset = "none",
        ["<up>"] = { "select_prev", "fallback" },
        ["<down>"] = { "select_next", "fallback" },
        ["<cr>"] = { "accept", "fallback" },
        ["<tab>"] = { "select_and_accept", "fallback" },
      },
      completion = {
        menu = {
          auto_show = false,
        },
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
        ghost_text = {
          enabled = true,
          show_with_selection = true,
          show_without_selection = true,
        },
      },
      signature = {
        enabled = true,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { eslint = {} },
      setup = {
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            elseif client.name == "vtsls" then
              client.server_capabilities.documentFormattingProvider = false
            end
          end)
        end,
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        separator_style = "slant",
        max_name_length = 30,
        indicator = {
          style = "underline",
        },
        show_close_icon = false,
        show_buffer_close_icons = false,
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.lsp.signature = {
        auto_open = { enabled = false },
      }
    end,
  },
}
