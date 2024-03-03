vim.cmd('autocmd FileType lua set noexpandtab')

local ls = require("luasnip")
ls.add_snippets("go", require("lua/snippets/go"))
