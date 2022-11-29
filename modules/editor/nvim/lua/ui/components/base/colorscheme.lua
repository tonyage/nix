local colors = require("ui.themer").colorscheme("vivid")
return {
  Comment = { fg = colors.grey01, italic = true },
  Conceal = { bg = "NONE" },
  ColorColumn = { bg = colors.base01, sp = "none" },
  CursorColumn = { bg = colors.base01, sp = "none" },
  Cursor = { fg = colors.base00, bg = colors.base05 },
  CursorLine = { bg = "none", sp = "none" },
  CursorLineNr = { fg = colors.white },

  Debug = { fg = colors.base08 },
  Directory = { fg = colors.base0D },

  -- floating windows
  FloatBorder = { fg = colors.blue },
  NormalFloat = { bg = colors.base01 },
  NvimInternalError = { fg = colors.red },
  WinSeparator = { fg = colors.grey00 },

  -- text style
  Bold = { bold = true },
  Italic = { italic = true },
  UnderLined = { fg = colors.base0B },

  Error = { fg = colors.base00, bg = colors.base0F },
  ErrorMsg = { fg = colors.base0F, bg = colors.base00 },
  Exception = { fg = colors.base0F },

  FoldColumn = { fg = colors.base0C, bg = colors.base01 },
  Folded = { fg = colors.base03, bg = colors.base01 },

  healthSuccess = { fg = colors.black, bg = colors.green },
  IncSearch = { fg = colors.base01, bg = colors.base09 },
  LineNr = { fg = colors.grey00 },

  Macro = { fg = colors.base08 },
  MatchWord = { bg = colors.grey00, fg = colors.white },
  MatchParen = { link = "MatchWord" },
  ModeMsg = { fg = colors.base0B },
  MoreMsg = { fg = colors.base0B },

  NonText = { fg = colors.base03 },
  Normal = { fg = colors.base05, bg = colors.base00 },

  Pmenu = { bg = colors.base00 },
  PmenuSbar = { bg = colors.base00 },
  PmenuSel = { bg = colors.blue, fg = colors.base00 },
  PmenuThumb = { bg = colors.grey00 },

  Question = { fg = colors.base0D },
  QuickFixLine = { bg = colors.base01, sp = "none" },

  Search = { fg = colors.base01, bg = colors.base0A },
  SignColumn = { fg = colors.base03, sp = "NONE" },
  SpecialKey = { fg = colors.base03 },
  SpellBad = { undercurl = true, sp = colors.base0F },
  SpellLocal = { undercurl = true, sp = colors.base0C },
  SpellCap = { undercurl = true, sp = colors.base0D },
  SpellRare = { undercurl = true, sp = colors.base0E },
  Substitute = { fg = colors.base01, bg = colors.base0A, sp = "none" },
  Statement = { fg = colors.base08 },

  Title = { fg = colors.base0D, sp = "none" },
  TooLong = { fg = colors.base0F },

  Visual = { bg = colors.base02 },
  VisualNOS = { fg = colors.base0F },

  WarningMsg = { fg = colors.base0A },
  WildMenu = { fg = colors.base08, bg = colors.base0A },

  -- Boolean = { fg = colors.base09 },
  -- Character = { fg = colors.base0A },
  -- Conditional = { fg = colors.base0E, bold = true, italic = true },
  -- Constant = { fg = colors.base09 },

  -- Define = { fg = colors.base0E, sp = "none" },
  -- Delimiter = { fg = colors.base09 },
  -- Float = { fg = colors.base09 },

  -- Variable = { fg = colors.base05 },
  -- Function = { fg = colors.base0D },
  -- Identifier = { fg = colors.base08, sp = "none" },

  -- Include = { fg = colors.base0D },

  -- Label = { fg = colors.base0A },
  -- Number = { fg = colors.base09 },
  -- Operator = { fg = colors.base05, sp = "none" },
  -- PreProc = { fg = colors.base0A },
  -- Repeat = { fg = colors.base0A },

  -- Special = { fg = colors.base0C },
  -- SpecialChar = { fg = colors.base0F },
  -- StorageClass = { fg = colors.base0A },

  -- Tag = { fg = colors.base0A },
  -- Todo = { fg = colors.base09, bg = colors.base00 },
}

