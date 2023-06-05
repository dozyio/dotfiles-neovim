return {
  "goolord/alpha-nvim",
  opts = function()
    require("alpha")
    require("alpha.term")

    local dashboard = require("alpha.themes.dashboard")

    local imgWidth = 46
    local imgHeight = 25 -- two pixels per vertical space
    local imgTitle = {"🔥  𝕟 𝕖 𝕠 𝕧 𝕚 𝕞  🔥"}

    local displayImg = function()
      if vim.fn.winheight('%') > 30 then
        return "cat | " .. os.getenv("HOME") .. "/.config/nvim/art/thisisfine.sh"
      else
        imgWidth = 0
        imgHeight = 0
        imgTitle = {
            [[                               __                ]],
            [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
            [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
            [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
            [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
            [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
        }
      end
    end

    dashboard.section.buttons.val = {
      dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
      dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
      dashboard.button("s", "勒" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
      dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
      dashboard.button("q", " " .. " Quit", ":qa<CR>"),
    }

    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end


    dashboard.section.footer.opts.hl = "Type"
    dashboard.section.header.opts.hl = "AlphaShortcut"
    dashboard.section.buttons.opts.hl = "AlphaButtons"

    -- dashboard.section.terminal.command = "cat | " .. os.getenv("HOME") .. "/.config/art/thisisfine.sh"
    dashboard.section.terminal.command = displayImg()
    dashboard.section.terminal.width = imgWidth
    dashboard.section.terminal.height = imgHeight
    dashboard.section.terminal.opts.redraw = true

    dashboard.section.header.val = imgTitle

    dashboard.config.layout = {
      { type = "padding", val = 1 },
      dashboard.section.terminal,
      { type = "padding", val = 5 },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      { type = "padding", val = 1 },
      dashboard.section.footer,
    }

    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
