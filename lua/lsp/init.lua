local lsp = require('lsp-zero').preset({})
local lspconfig = require 'lspconfig'

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

local home=os.getenv( "HOME" )

--[[ local function golangciConfig()
  local f=io.open(vim.fn.getcwd() .. "/.golangci.yml", "r")
  if f~=nil then
    io.close(f)
    return vim.fn.getcwd() .. "/.golangci.yml"
  else
    return home .. "/.golangci.yml"
  end
end

require'lspconfig'.golangci_lint_ls.setup{
	filetypes = {'go', 'gomod'},
  root_dir = lspconfig.util.root_pattern('go.mod'),
  init_options = {
      command = { "golangci-lint", "run", "-c", golangciConfig(), "--out-format", "json", "--issues-exit-code=1" };
  }
} ]]

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- require("codecompanion").setup({
--   strategies = {
--     chat = {
--       adapter = "ollama",
--     },
--     inline = {
--       adapter = "ollama",
--     },
--   },
-- })

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
-- local luasnip = require("luasnip")

-- local has_words_before = function()
--   unpack = unpack or table.unpack
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
-- end

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  sources = {
    -- { name = 'copilot' },
    { name = 'supermaven' },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 3 },
    -- { name = 'luasnip' },
  },
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = false}),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    -- ["<Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_next_item()
    --   -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
    --   -- that way you will only jump inside the snippet region
    --   elseif luasnip.expand_or_locally_jumpable() then
    --     luasnip.expand_or_jump()
    --   elseif has_words_before() then
    --     cmp.complete()
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
    --
    -- ["<S-Tab>"] = cmp.mapping(function(fallback)
    --   if cmp.visible() then
    --     cmp.select_prev_item()
    --   elseif luasnip.jumpable(-1) then
    --     luasnip.jump(-1)
    --   else
    --     fallback()
    --   end
    -- end, { "i", "s" }),
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      -- require("copilot_cmp.comparators").prioritize,

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

vim.keymap.set("n", "<c-up>", function()
  vim.diagnostic.goto_prev()
  vim.cmd("normal! zz")
end, { noremap = true, nowait = true, silent = true })
vim.keymap.set("n", "<c-down>", function()
  vim.diagnostic.goto_next()
  vim.cmd("normal! zz")
end, { noremap = true, nowait = true, silent = true })

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

-- local ls = require("luasnip")
--
-- vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
--
-- vim.keymap.set({"i", "s"}, "<C-E>", function()
-- 	if ls.choice_active() then
-- 		ls.change_choice(1)
-- 	end
-- end, {silent = true})

-- show coverage
vim.cmd([[
  augroup AutoCoverageOnBufRead
    autocmd!
    autocmd FileType typescript lua require('coverage').load(true)
  augroup END
]])
