local colors = require("ui.themer").colorscheme("vivid")

return {
  NvimTreeEmptyFolderName = { fg = colors.blue },
  NvimTreeEndOfBuffer = { fg = colors.base01 },
  NvimTreeFolderIcon = { fg = colors.blue },
  NvimTreeFolderName = { fg = colors.blue },
  NvimTreeGitDirty = { fg = colors.red },
  NvimTreeIndentMarker = { fg = colors.grey01 },
  NvimTreeNormal = { bg = colors.base01 },
  NvimTreeNormalNC = { bg = colors.base01 },
  NvimTreeOpenedFolderName = { fg = colors.blue },
  NvimTreeGitIgnored = { fg = colors.grey01 },
  NvimTreeWinSeparator = { fg = colors.grey00, bg = colors.base01 },
  NvimTreeWindowPicker = { fg = colors.red, bg = colors.base02 },
  NvimTreeCursorLine = { bg = colors.base02 },
  NvimTreeGitNew = { fg = colors.yellow },
  NvimTreeGitDeleted = { fg = colors.red },
  NvimTreeSpecialFile = { fg = colors.yellow, bold = true },
  NvimTreeRootFolder = { fg = colors.red, bold = true },
  NvimTreeSymlink = { fg = colors.cyan, bold = true }
}

