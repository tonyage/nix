local colors = require("ui.themer").colorscheme("vivid")
local statusline_bg = colors.base01

return {
  StatusLine = { bg = statusline_bg },
  St_gitIcons = { fg = colors.orange, bg = statusline_bg, bold = true },

  -- lsp
  St_lspError = { fg = colors.red, bg = statusline_bg },
  St_lspWarning = { fg = colors.yellow, bg = statusline_bg },
  St_lspHints = { fg = colors.magenta, bg = statusline_bg },
  St_lspInfo = { fg = colors.green, bg = statusline_bg },
  St_lspStatus = { fg = colors.blue, bg = statusline_bg },
  St_lspProgress = { fg = colors.green, bg = statusline_bg },
  St_lspStatus_Icon = { fg = colors.black, bg = colors.blue },

  -- MODES
  St_NormalMode = { bg = colors.blue, fg = colors.black, bold = true },
  St_InsertMode = { bg = colors.magenta, fg = colors.black, bold = true },
  St_TerminalMode = { bg = colors.green, fg = colors.black, bold = true },
  St_NTerminalMode = { bg = colors.yellow, fg = colors.black, bold = true },
  St_VisualMode = { bg = colors.cyan, fg = colors.black, bold = true },
  St_ReplaceMode = { bg = colors.orange, fg = colors.black, bold = true },
  St_ConfirmMode = { bg = colors.teal, fg = colors.black, bold = true },
  St_CommandMode = { bg = colors.green, fg = colors.black, bold = true },
  St_SelectMode = { bg = colors.blue, fg = colors.black, bold = true },

  -- Separators
  St_NormalModeSep = { fg = colors.blue, bg = colors.grey00 },
  St_InsertModeSep = { fg = colors.magenta, bg = colors.grey00 },
  St_TerminalModeSep = { fg = colors.green, bg = colors.grey00 },
  St_NTerminalModeSep = { fg = colors.yellow, bg = colors.grey00 },
  St_VisualModeSep = { fg = colors.cyan, bg = colors.grey00 },
  St_ReplaceModeSep = { fg = colors.orange, bg = colors.grey00 },
  St_ConfirmModeSep = { fg = colors.teal, bg = colors.grey00 },
  St_CommandModeSep = { fg = colors.green, bg = colors.grey00 },
  St_SelectModeSep = { fg = colors.blue, bg = colors.grey00 },

  St_EmptySpace = { fg = colors.grey00, bg = colors.base02 },
  St_EmptySpace2 = { fg = colors.grey00, bg = colors.base02 },

  St_file_info = { fg = colors.white, bg = colors.base02 },
  St_file_sep = { fg = colors.base02, bg = statusline_bg },
  St_cwd_icon = { fg = colors.black, bg = colors.red },
  St_cwd_text = { fg = colors.white, bg = colors.base02 },
  St_cwd_sep = { fg = colors.red, bg = statusline_bg },
  St_pos_sep = { fg = colors.green, bg = colors.grey00 },
  St_pos_icon = { fg = colors.black, bg = colors.green },
  St_pos_text = { fg = colors.green, bg = colors.grey00 },
}

