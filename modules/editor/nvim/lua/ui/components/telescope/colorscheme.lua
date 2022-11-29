local colors = require("ui.themer").colorscheme("vivid")

return {
  TelescopeBorder = { fg = colors.base00, bg = colors.base00 },
  TelescopePromptBorder = { fg = colors.base01, bg = colors.base01 },
  TelescopePromptNormal = { fg = colors.white, bg = colors.base01 },
  TelescopePromptPrefix = { fg = colors.red, bg = colors.base01 },

  TelescopeNormal = { bg = colors.base00 },

  TelescopePromptTitle = { fg = colors.black, bg = colors.red },
  TelescopePreviewTitle = { fg = colors.black, bg = colors.green },
  TelescopeResultsTitle = { fg = colors.white, bg = colors.base00 },

  TelescopeSelection = { bg = colors.base01, fg = colors.white },

  TelescopeResultsDiffAdd = { fg = colors.green },
  TelescopeResultsDiffChange = { fg = colors.yellow },
  TelescopeResultsDiffDelete = { fg = colors.red },
}
