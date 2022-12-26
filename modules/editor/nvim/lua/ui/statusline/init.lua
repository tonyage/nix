local M = {}

vim.g.statusline_sep_style = "default"
local sections = require("ui.statusline.sections")

function M.setup()
  return table.concat {
    sections.mode(),
    sections.git(),

    "%=",
    sections.progress(),
    "%=",

    sections.diagnostics(),
    sections.status() or "",
    sections.position(),
  }
end

return M
