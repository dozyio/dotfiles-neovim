local wk = require("which-key")
-- normal mode leader mappings
wk.register({
    ["<leader>="] = { name = "EasyAlign" },
    ["<leader><space>"] = { name="Unhighlight search" },
    ["<leader>f"] = { name="Fix - i.e. Code action" },
    ["<leader>i"] = { name="Indent lines" },
    ["<leader>m"] = { name="Write and Make" },
    ["<leader>y"] = { name="Copy whole file to OS copy buffer" },
    ["<leader>d"] = { name="DB UI" },
    ["<leader>h"] = { name="Git hunk" },
    ["<leader>g"] = { name="Git diff" },
    ["<C-]>"] = { name="Next hunk" },
    ["<C-[>"] = { name="Previous hunk" },
    ["<C-Right>"] = { name="Next buffer" },
    ["<C-Left>"] = { name="Previous buffer" },
    ["<C-Down>"] = { name="Next error" },
    ["<C-Up>"] = { name="Previous error" },
    ["<M-Right>"] = { name="Right window" },
    ["<M-Left>"] = { name="Left window" },
    ["<M-Down>"] = { name="Down window" },
    ["<M-Up>"] = { name="Up window" },
    ["<C-X>"] = { name="Close buffer / window" },
    ["<C-l>"] = { name="Line numbers" },
    ["<C-n>"] = { name="Relative line numbers" },
    ["<C-p>"] = { name="CtrlP" },
})

-- visual mode leader mappings
wk.register({
    ["<leader>c"] = { name = "Copy selection to OS copy buffer" },
},
{
    mode = "v",
    silent = true
}
)
