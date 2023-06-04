local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'copilot' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 3 },
    { name = 'luasnip', group_index = 2 },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      require("copilot_cmp.comparators").prioritize,

      -- Below is the default comparitor list and order for nvim-cmp
      cmp.config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  experimental = {
    ghost_text = {
      hl_group = "LspCodeLens",
    },
  },
})

vim.keymap.set("n", "<c-up>", vim.diagnostic.goto_prev, { noremap = true, nowait = true, silent = true })
vim.keymap.set("n", "<c-down>", vim.diagnostic.goto_next, { noremap = true, nowait = true, silent = true })

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, nowait = true, silent = true, desc= "Goto definition" })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true, nowait = true, silent = true, desc = "Goto declaration" })
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation,  { noremap = true, nowait = true, silent = true, desc = "Goto implemntation" })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = "Goto references" })
    vim.keymap.set('n', 'gR', vim.lsp.buf.rename, { desc = "Rename symbol" })
    vim.keymap.set('n', 'gs', vim.lsp.buf.document_symbol, { desc = "Show symbols" })
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
    vim.keymap.set('n', '<leader>p', function()
      vim.lsp.buf.format { async = true }
    end, { buffer = ev.buf, desc = "Format" })
    vim.keymap.set('n', '<c-->', vim.lsp.buf.hover, { noremap = true, nowait = true, silent = true, desc = "Hover info"})
    vim.keymap.set('n', '<c-k>', vim.lsp.buf.signature_help, { buffer = ev.buf })
  end,
})
