require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  disable = function(lang, buf)
    local max_filesize = 256 * 1024 -- 100 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
      return true
    end
  end,
  indent = {
    enable = false,
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 2000, -- Do not enable for files with more than 2000 lines, int
    query = 'rainbow-parens',
    strategy = require('ts-rainbow').strategy.global
  }
}

