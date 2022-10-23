require 'gitsigns'.setup()
require 'lsp_signature'.setup()
require 'Comment'.setup()
require 'go'.setup()
vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)

require 'nvim-dap-virtual-text'.setup()
require 'null-ls'.setup({
    sources = {
        -- require 'null-ls'.builtins.diagnostics.eslint,
        require 'null-ls'.builtins.formatting.prettier.with({
            filetypes = { "html", "yaml", "markdown" },
            extra_filetypes = { "gohtmltmpl", "toml" },
            only_local = "node_modules/.bin",
        }),
    },
    -- you can reuse a shared lspconfig on_attach callback here
    on_attach = function(client)
        if client.server_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end,
})
require 'bufferline.settings'
require 'galaxyline.settings'
require 'lsp.settings'
require 'treesitter.settings'
require 'which-key.settings'
require 'telescope.settings'
require 'globals.settings'
require 'theme.settings'
-- require 'ftplugin.js'
require 'nvim-tree'.setup()

function ContextSetup(show_all_context)
    require("treesitter-context").setup({
        enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        show_all_context = show_all_context,
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            -- For all filetypes
            -- Note that setting an entry here replaces all other patterns for this entry.
            -- By setting the 'default' entry below, you can control which nodes you want to
            -- appear in the context window.
            default = {
                "function",
                "method",
                "for",
                "while",
                "if",
                "switch",
                "case",
            },

            rust = {
                "loop_expression",
                "impl_item",
            },

            typescript = {
                "class_declaration",
                "abstract_class_declaration",
                "else_clause",
            },
        },
    })
end

ContextSetup(true)

-- vim.filetype.add({
--     extension = {
--         h = function()
--             -- Use a lazy heuristic that #including a C++ header means it's a
--             -- C++ header
--             if vim.fn.search("{{", "nw") == 1 then
--                 return "gohtmltmpl"
--             end
--         end,
--     },
-- })
