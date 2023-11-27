vim.cmd("highlight TSRainbowRed guifg=#E06C75 ctermfg=White")
vim.cmd("highlight TSRainbowYellow guifg=#E5C07B ctermfg=White")
vim.cmd("highlight TSRainbowBlue guifg=#98C379 ctermfg=White")
vim.cmd("highlight TSRainbowOrange guifg=#56B6C2 ctermfg=White")
vim.cmd("highlight TSRainbowGreen guifg=#61AFEF ctermfg=White")
vim.cmd("highlight TSRainbowViolet guifg=#C678DD ctermfg=White")
vim.cmd("highlight TSRainbowCyan guifg=#d65d0e ctermfg=White")

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false
  },
  disable = function(lang, buf)
    local max_filesize = 256 * 1024
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    if ok and stats and stats.size > max_filesize then
      return true
    end
  end,
  indent = {
    -- enable = false,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 2500,
    query = 'rainbow-parens',
    -- strategy = require('ts-rainbow').strategy.global
  }
}
