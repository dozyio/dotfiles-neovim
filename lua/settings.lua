require 'lsp_signature'.setup()
require 'Comment'.setup()
require 'go'.setup()
require 'null-ls'.setup({
    sources = {
        require 'null-ls'.builtins.formatting.prettier.with({
            filetypes = { "html", "json", "yaml", "markdown" },
            extra_filetypes = { "gohtmltmpl", "toml" },
            only_local = "node_modules/.bin",
        }),
    }
})
require 'bufferline.settings'
require 'galaxyline.settings'
require 'lsp.settings'
require 'treesitter.settings'
require 'which-key.settings'
require 'telescope.settings'
require 'globals.settings'

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
