-- require("ui.themer").highlight("statusline")
local M = {}
vim.g.statusline_sep_style = "default"
local modules = require("ui.components.statusline.modules")

function M.setup()
  return table.concat {
    modules.mode(),
    modules.git(),

    "%=",
    modules.progress(),
    "%=",

    modules.diagnostics(),
    modules.status() or "",
    modules.position(),
  }
end

return M
