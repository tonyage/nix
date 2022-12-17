local M = {}

require("ui.themer").load()
require("ui.components.cmp")
require("ui.components.git")
require("ui.components.winbar")
require("ui.components.devicons")
require("ui.components.treesitter")
require("ui.components.telescope")
require("ui.components.blankline")
require("ui.components.nvimtree")

M.require = function(path)
  return setmetatable({}, {
    __index = function(_, k) return require(path)[k] end,
    __newindex = function(_, k, v) require(path)[k] = v end
  })
end

M.refresh = function()
  vim.cmd("redrawtabline")
  vim.cmd("redraw")
end

M.tabuffline = function()
  return require("ui.components.tabuffline").setup()
end

M.setup = function()
  vim.opt.statusline = "%!v:lua.require('ui.components.statusline').setup()"
  require("ui.components.tabuffline.lazy")({ lazyload = true })
end

return M

