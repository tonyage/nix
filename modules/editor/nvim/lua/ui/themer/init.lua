local Themer = {}

function Themer.colorscheme(variant)
  local path = "ui.themer.colorschemes." .. vim.g.colorscheme
  local colorscheme = require(path)
  return colorscheme[variant]
end

function Themer.highlight(group)
  if type(group) == "string" then
    group = require("ui.components." .. group .. ".colorscheme")
  end

  for k, v in pairs(group) do
    vim.api.nvim_set_hl(0, k, v)
  end
end

function Themer.load()
  local groups = { "base", "statusline" }
  for _, group in pairs(groups) do
    Themer.highlight(group)
  end
end

function Themer.merge(x, y)
  return vim.tbl_deep_extend("force", x, y)
end

return Themer

