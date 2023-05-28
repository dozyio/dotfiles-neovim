require("bufferline").setup({
  options = {
    close_command = function(n) require("mini.bufremove").delete(n, false) end,
    right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
    show_close_icon = false,
    show_buffer_close_icons = false,
    separator_style = "padded_slant",
    max_name_length = 30,
    diagnostics = "nvim_lsp",
    always_show_bufferline = true,
    indicator = {
      style = "underline"
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "NvimTree",
        text_align = "center",
      },
    },
  },
})
