local colors = require("ui.themer").colorscheme("vivid")

return {
  TblineFill = {
    bg = colors.base01,
  },

  TbLineBufOn = {
    fg = colors.white,
    bg = colors.black,
  },

  TbLineBufOff = {
    fg = colors.white,
    bg = colors.base01,
  },

  TbLineBufOnModified = {
    fg = colors.green,
    bg = colors.black,
  },

  TbBufLineBufOffModified = {
    fg = colors.red,
    bg = colors.base01,
  },

  TbLineBufOnClose = {
    fg = colors.red,
    bg = colors.black,
  },

  TbLineBufOffClose = {
    fg = colors.grey00,
    bg = colors.base01,
  },

  TblineTabNewBtn = {
    fg = colors.white,
    bg = colors.base03,
    bold = true,
  },

  TbLineTabOn = {
    fg = colors.black,
    bg = colors.blue,
    bold = true,
  },

  TbLineTabOff = {
    fg = colors.white,
    bg = colors.base02,
  },

  TbLineTabCloseBtn = {
    fg = colors.black,
    bg = colors.blue,
  },

  TBTabTitle = {
    fg = colors.black,
    bg = colors.white,
  },

  TbLineThemeToggleBtn = {
    bold = true,
    fg = colors.white,
    bg = colors.base03,
  },

  TbLineCloseAllBufsBtn = {
    bold = true,
    bg = colors.red,
    fg = colors.black,
  },
}
