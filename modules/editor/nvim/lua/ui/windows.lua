local M = {}

M.not_focusable = {
  border = "single",
  focusable = false,
  relative = "win",
  anchor = "SE",
  row = 0,
  col = 0,
}

M.hl_rounded_borders = function(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

M.hl_square_borders = function(hl_name)
  return {
    { "⎡", hl_name },
    { "─", hl_name },
    { "⎤", hl_name },
    { "│", hl_name },
    { "⎦", hl_name },
    { "─", hl_name },
    { "⎣", hl_name },
    { "│", hl_name },
  }
end

M.rounded_borders = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }

-- M.square_borders = { "─", "│", "─", "│", "⎡", "⎤", "⎦", "⎣" }
M.square_borders = { "─", "│", "─", "│", "⸢", "⸣", "⸥", "⸤" }

return M

