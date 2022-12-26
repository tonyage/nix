require("ui.themer").highlight("blankline")

local config = {
  space_char_blankline = " ",
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
}

require("indent_blankline").setup(config)
