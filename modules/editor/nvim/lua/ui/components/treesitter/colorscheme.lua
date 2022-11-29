local colors = require("ui.themer").colorscheme("vivid")

return {

  ["@annotation"] = { fg = colors.base0A, italic = true },
  ["@attribute"] = { fg = colors.base0A },
  ["@character"] = { fg = colors.base09 },
  ["@constructor"] = { fg = colors.base0A },

  ["@constant"] = { fg = colors.base08 },
  ["@constant.builtin"] = { fg = colors.base08, italic = true },
  ["@constant.macro"] = { fg = colors.base08, bold = true },

  ["@define"] = { fg = colors.base0E, sp = "none" },
  ["@prepoc"] = { fg = colors.base0E },
  ["@repeat"] = { fg = colors.base0A },

  ["@error"] = { fg = colors.base0F },
  ["@exception"] = { fg = colors.base0F },

  ["@keyword"] = { fg = colors.base0E, bold = true, italic = true },
  ["@keyword.function"] = { fg = colors.base0E, bold = true, italic = true },
  ["@keyword.return"] = { fg = colors.base0E, bold = true, italic = true },
  ["@keyword.operator"] = { fg = colors.base0E },

  ["@function"] = { fg = colors.base0D },
  ["@function.builtin"] = { fg = colors.base0D },
  ["@function.macro"] = { fg = colors.base08 },

  ["@label"] = { fg = colors.base05, bold = true },
  ["@number"] = { fg = colors.base09 },
  ["@float"] = { link = "@number" },
  ["@boolean"] = { fg = colors.base0E, italic = true },

  ["@method"] = { fg = colors.base0D },
  ["@property"] = { fg = colors.base08 },
  ["@namespace"] = { fg = colors.base0E },
  ["@none"] = { fg = colors.base05 },
  ["@parameter"] = { fg = colors.base09 },
  ["@reference"] = { fg = colors.base05 },

  ["@punctuation"] = { fg = colors.white },
  ["@punctuation.bracket"] = { fg = colors.white },
  ["@punctuation.special"] = { fg = colors.base08 },
  ["@operator"] = { fg = colors.base05, sp = "none" },

  ["@string"] = { fg = colors.base0B, italic = true },
  ["@string.regex"] = { fg = colors.base0C },
  ["@string.escape"] = { fg = colors.base0C },
  ["@structure"] = { fg = colors.base0E, bold = true },
  ["@storageclass"] = { fg = colors.base0A },

  ["@symbol"] = { fg = colors.base0B },

  ["@tag"] = { fg = colors.base0A },
  ["@tag.attribute"] = { link = "@property" },
  ["@tag.delimiter"] = { fg = colors.base0F },

  ["@text"] = { fg = colors.base05 },
  ["@text.strong"] = { bold = true },
  ["@text.emphasis"] = { fg = colors.base09 },
  ["@text.strike"] = { fg = colors.base00, strikethrough = true },
  ["@text.literal"] = { fg = colors.base09, italic = true },
  ["@text.todo"] = { fg = colors.base09, bg = colors.base00 },
  ["@text.uri"] = { fg = colors.base09, underline = true },

  ["@type"] = { fg = colors.base0A, sp = "none", bold = true },
  ["@type.defintion"] = { fg = colors.base0A, sp = "none", bold = true, italic = true },

  ["@variable"] = { fg = colors.base05 },
  ["@variable.builtin"] = { fg = colors.base09 },

  -- variable.global
  TSDefinitionUsage = { sp = colors.base04, underline = true },

  ["@definition"] = { sp = colors.base04, underline = true },
  ["@scope"] = { bold = true },
  ["@field"] = { fg = colors.base08 },
  ["@include"] = { fg = colors.base0E, italic = true },
  ["@conditional"] = { fg = colors.base0E, italic = true },
}

