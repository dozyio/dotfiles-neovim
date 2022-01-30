require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        -- additional_vim_regex_highlighting = true
    },
    indent = {
        enable = false,
    },
    rainbow = {
        enable = true,
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = 2000, -- Do not enable for files with more than 2000 lines, int
        colors = {
            "#bf616a",
            "#d08770",
            "#ebcb8b",
            "#a3be8c",
            "#88c0d0",
            "#5e81ac",
            "#b48ead",
        }
    }
}
