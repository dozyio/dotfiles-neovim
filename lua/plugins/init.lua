return {
  -- Libs
  {
    "nvim-lua/plenary.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-lua/popup.nvim",
    event = "VeryLazy",
  },
  {
    "MunifTanjim/nui.nvim",
    event = "VeryLazy",
  },

  -- Theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
  },

  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },

  -- Navigation
  {
    "kyazdani42/nvim-tree.lua",
    lazy = true,
    event = "VeryLazy",
    opts = {
      filters = { custom = { "^.git$" } }
    }
  },
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
  },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    event = "VeryLazy",
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufReadPost",
    opts = {
      lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
      lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
      lastplace_open_folds = true
    }
  },

  -- Winbar / Buffers
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "catppuccin/nvim",
      {
        "echasnovski/mini.nvim",
        version = false,
      }
    },
  },

  -- Status bar
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "arkav/lualine-lsp-progress",
    }
  },

  -- Comments
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- Utils
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      window = {
        winblend = 10,
      }
    }
  },

  -- Sessions
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {}
  },

  -- Context / Breadcrumbs
  -- TODO need both?
  { "Bekaboo/dropbar.nvim" },
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    dependencies = {
      "SmiteshP/nvim-navic",
    },
    event = "VeryLazy",
    opts = {},
  },

  -- Treesitter
  "nvim-treesitter/nvim-treesitter",
  "HiPhish/nvim-ts-rainbow2",
  { "nvim-treesitter/playground", event = "VeryLazy", },

  -- Indent
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      show_current_context = true,
      use_treesitter = true,
      filetype_exclude = {
        "help",
        "alpha",
        "dashboard",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "lazyterm",
      },
    }
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    config = true,
  },

  -- LSP
  {
    "VonHeikemen/lsp-zero.nvim",
    event = "BufReadPre",
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

      -- Luasnip
      {
        "L3MON4D3/LuaSnip",
        -- dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load({})
        end,
      },
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

  -- Git
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signcolumn = false,
      linehl = false,
      word_diff = false,
      numhl = true,
      current_line_blame_opts = {
        delay = 0,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, { expr=true, desc="Next hunk" })

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, { expr=true, desc="Previous hunk" })

        -- Actions
        map('n', '<leader>hl', ":LazyGit<CR>", { desc = "LazyGit" })
        map('n', '<leader>hs', gs.stage_hunk, { desc = "Stage hunk" })
        map('n', '<leader>hr', gs.reset_hunk, { desc = "Reset hunk" })
        map('n', '<leader>hS', gs.stage_buffer, { desc = "Stage buffer" })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = "Undo stage hunk" })
        map('n', '<leader>hR', gs.reset_buffer, { desc = "Reset buffer" })
        map('n', '<leader>hp', gs.preview_hunk, { desc = "Preview hunk" })
        map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = "Blame" })
        map('n', '<leader>hd', gs.diffthis, { desc = "Diff" })
        map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = "Diff buffer" })
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = "Toggle blame" })
        map('n', '<leader>td', gs.toggle_deleted, { desc = "Toggle deleted" })
        map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end, { desc = "Stage selected" })
        map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end, { desc = "Reset selected" })

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    }
  },

  -- Commit
  {
    "rhysd/committia.vim",
    event = "VeryLazy",
  },

  -- LazyGit
  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  -- Quickfix
  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
  },

  -- Languages
  -- go
  {
    "ray-x/go.nvim",
    ft = { "go", "gomod" },
    dependencies = { -- optional packages
      { "leoluz/nvim-dap-go", ft = { "go" }, },
      { "mfussenegger/nvim-dap", ft = { "go" }, },
      { "ray-x/guihua.lua", ft = { "go" }, },
      { "rcarriga/nvim-dap-ui", ft = { "go" }, },
      { "theHamsta/nvim-dap-virtual-text", ft = { "go" }, },
    },
    config = true,
    event = "VeryLazy",
    build = ':lua require("go.install").update_all_sync()' -- installs binaries
  },
  -- markdown
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = ":call mkdp#util#install()"
  },

  -- Zen mode
  {
    "folke/zen-mode.nvim",
    event = "VeryLazy",
    config = function()
      require("zen-mode").setup {
        window = {
          backdrop = .75,
          height = .95,
          width = .95,
          options = {
            number = false,
            relativenumber = false,
            signcolumn = "no",
            list = false,
            cursorline = false,
          },
        },
        plugins = {
          options = {
            enabled = true,
            ruler = false,
            showcmd = false,
            colorcolumn = "",
            cmdheight = 0,
          },
          gitsigns = { enabled = false },
          kitty = {
            enabled = true,
            font = "+4", -- font size increment
          },
        },
      }
    end,
  },

  -- New plugins to try
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          timeout = 1500,
          fps = 60,
          render = "compact",
          max_height = function()
            return math.floor(vim.o.lines * 0.75)
          end,
          max_width = function()
            return math.floor(vim.o.columns * 0.75)
          end,
        }
      }
    }
  },
  {
    "lvimuser/lsp-inlayhints.nvim"
  },
}
