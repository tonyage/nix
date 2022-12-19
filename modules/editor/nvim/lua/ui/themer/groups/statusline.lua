local colors = require("ui.themer").colorscheme("vivid")
local statusline_bg = colors.base01

return {
  StatusLine = { bg = statusline_bg },

  git_branch = { fg = colors.white, bg = colors.base02, bold = true },
  git_added = { fg = colors.green, bg = colors.base02, bold = true },
  git_changed = { fg = colors.yellow, bg = colors.base02, bold = true },
  git_removed = { fg = colors.red, bg = colors.base02, bold = true },
  git_sep = { fg = colors.base02, bg = statusline_bg }, 

  -- lsp
  lsp_error = { fg = colors.red, bg = statusline_bg },
  lsp_warning = { fg = colors.yellow, bg = statusline_bg },
  lsp_hints = { fg = colors.magenta, bg = statusline_bg },
  lsp_info = { fg = colors.green, bg = statusline_bg },
  lsp_progress = { fg = colors.green, bg = statusline_bg },
  lsp_sep = { fg = colors.red, bg = statusline_bg },
  lsp_icon = { fg = colors.black, bg = colors.red },
  lsp_text = { fg = colors.white, bg = colors.grey00 },

  -- MODES
  NormalMode = { bg = colors.blue, fg = colors.black, bold = true },
  InsertMode = { bg = colors.magenta, fg = colors.black, bold = true },
  TerminalMode = { bg = colors.green, fg = colors.black, bold = true },
  NTerminalMode = { bg = colors.yellow, fg = colors.black, bold = true },
  VisualMode = { bg = colors.cyan, fg = colors.black, bold = true },
  ReplaceMode = { bg = colors.orange, fg = colors.black, bold = true },
  ConfirmMode = { bg = colors.teal, fg = colors.black, bold = true },
  CommandMode = { bg = colors.green, fg = colors.black, bold = true },
  SelectMode = { bg = colors.blue, fg = colors.black, bold = true },

  -- Separators
  NormalModeSep = { fg = colors.blue, bg = colors.grey00 },
  InsertModeSep = { fg = colors.magenta, bg = colors.grey00 },
  TerminalModeSep = { fg = colors.green, bg = colors.grey00 },
  NTerminalModeSep = { fg = colors.yellow, bg = colors.grey00 },
  VisualModeSep = { fg = colors.cyan, bg = colors.grey00 },
  ReplaceModeSep = { fg = colors.orange, bg = colors.grey00 },
  ConfirmModeSep = { fg = colors.teal, bg = colors.grey00 },
  CommandModeSep = { fg = colors.green, bg = colors.grey00 },
  SelectModeSep = { fg = colors.blue, bg = colors.grey00 },

  buffer = { fg = colors.grey00, bg = colors.base02 },

  file_info = { fg = colors.white, bg = colors.base02 },
  file_sep = { fg = colors.base02, bg = statusline_bg },
  cwd_icon = { fg = colors.black, bg = colors.red },
  cwd_text = { fg = colors.white, bg = colors.base02 },
  cwd_sep = { fg = colors.red, bg = statusline_bg },
  pos_sep = { fg = colors.green, bg = colors.grey00 },
  pos_icon = { fg = colors.black, bg = colors.green },
  pos_text = { fg = colors.green, bg = colors.grey00 },
}

