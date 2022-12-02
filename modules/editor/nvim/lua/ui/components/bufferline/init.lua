require("ui.themer").highlight("bufferline")
local config = {
  options = {
    buffer_close_icon = "  ",
    diagnostics = "nvim_lsp",
    indicator = {
      style = "icon"
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = function()
          return vim.fn.getcwd()
        end,
        text_align = "left",
        highlight = "Directory",
        separator = true,
      }
    },
    hover = {
      enable = true,
      delay = 200,
      reveal = { "close" },
    },
    truncate_names = true,
    show_close_icon = false,
    show_buffer_icons = false,
  }
}
require("bufferline").setup(config)
