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
    fg = colors.grey01,
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
    bg = colors.base00,
  },
  BufferLineCloseButtonVisible = {
    fg = colors.red,
    bg = colors.base02,
  },
  BufferLineCloseButtonSelected = {
    fg = colors.grey00,
    bg = colors.base00,
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

  BufferLineOffsetSeparator = { fg = colors.base01, bg = colors.base02,},

  -- tabs
  BufferLineTab = { fg = colors.grey00, bg = colors.grey02 },
  BufferLineTabSelected = { fg = colors.base01, bg = colors.blue },
  BufferLineTabClose = { fg = colors.red, bg = colors.black },

  BufferLineDevIconDefaultSelected = { bg = "none" },
  BufferLineDevIconDefaultInactive = { bg = "none" },

  BufferLineDuplicate = { fg = "NONE", bg = colors.base01 },
  BufferLineDuplicateSelected = { fg = colors.red, bg = colors.black },
  BufferLineDuplicateVisible = { fg = colors.blue, bg = colors.black },
  BufferLineRightCustomAreaText1 = { fg = colors.white },
  BufferLineRightCustomAreaText2 = { fg = colors.red },
}
