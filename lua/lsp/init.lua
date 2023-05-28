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
  sources = {
    { name = 'nvim_lsp' },
    { name = 'nvim_lsp_signature_help' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 3 },
    { name = 'luasnip', keyword_length = 2 },
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
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true, nowait = true, silent = true })
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true, nowait = true, silent = true })
    vim.keymap.set('n', 'gI', vim.lsp.buf.implementation,  { noremap = true, nowait = true, silent = true })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<leader>f', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', '<leader>p', function()
      vim.lsp.buf.format { async = true }
    end, opts)
    vim.keymap.set('n', '<c-_>', vim.lsp.buf.hover, { noremap = true, nowait = true, silent = true })
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
  end,
})

-- Which Key
local wk = require("which-key")
wk.register({
  ["gd"] = { "Goto definition" },
  ["gD"] = { "Goto declaration" },
  ["gI"] = { "Goto implementation" },
  ["gr"] = { "View references" },
  ["<leader>f"] = { "Code action" },
  ["<leader>p"] = { "Format" },
})
