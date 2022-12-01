local colors = require("ui.themer").colorscheme("vivid")

return {

  BufferLineBackground = {
    fg = colors.grey00,
    bg = colors.base01,
  },

  BufferlineIndicatorVisible = {
    fg = colors.base01,
    bg = colors.base01,
  },

  -- buffers
  BufferLineBufferSelected = {
    fg = colors.white,
    bg = colors.black,
  },

  BufferLineBufferVisible = {
    fg = colors.grey00,
    bg = colors.base01,
  },

  -- for diagnostics = "nvim_lsp"
  BufferLineError = {
    fg = colors.grey00,
    bg = colors.base01,
  },
  BufferLineErrorDiagnostic = {
    fg = colors.grey00,
    bg = colors.base01,
  },

  -- close buttons
  BufferLineCloseButton = {
    fg = colors.grey00,
    bg = colors.base01,
  },
  BufferLineCloseButtonVisible = {
    fg = colors.grey00,
    bg = colors.base01,
  },
  BufferLineCloseButtonSelected = {
    fg = colors.red,
    bg = colors.black,
  },
  BufferLineFill = {
    fg = colors.grey01,
    bg = colors.base01,
  },
  BufferlineIndicatorSelected = {
    fg = colors.black,
    bg = colors.black,
  },

  -- modified
  BufferLineModified = {
    fg = colors.red,
    bg = colors.base01,
  },
  BufferLineModifiedVisible = {
    fg = colors.red,
    bg = colors.base01,
  },
  BufferLineModifiedSelected = {
    fg = colors.green,
    bg = colors.black,
  },

  -- separators
  BufferLineSeparator = {
    fg = colors.base01,
    bg = colors.base01,
  },
  BufferLineSeparatorVisible = {
    fg = colors.base01,
    bg = colors.base01,
  },
  BufferLineSeparatorSelected = {
    fg = colors.base01,
    bg = colors.base01,
  },

  -- tabs
  BufferLineTab = { fg = colors.grey00, bg = colors.one_bg3 },
  BufferLineTabSelected = { fg = colors.base01, bg = colors.nord_blue },
  BufferLineTabClose = { fg = colors.red, bg = colors.black },

  BufferLineDevIconDefaultSelected = { bg = "none" },
  BufferLineDevIconDefaultInactive = { bg = "none" },

  BufferLineDuplicate = { fg = "NONE", bg = colors.base01 },
  BufferLineDuplicateSelected = { fg = colors.red, bg = colors.black },
  BufferLineDuplicateVisible = { fg = colors.blue, bg = colors.base01 },
  BufferLineRightCustomAreaText1 = { fg = colors.white },
  BufferLineRightCustomAreaText2 = { fg = colors.red },
}
