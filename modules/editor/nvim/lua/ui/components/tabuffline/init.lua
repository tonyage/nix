local util = require("ui.components")
local M = {}

M.buf_is_valid = function(bufnr)
  return vim.bo[bufnr].buflisted and vim.api.nvim_buf_is_valid(bufnr)
end

M.bufilter = function()
  local bufs = vim.t.bufs or nil

  if not bufs then
    return {}
  end

  for i = #bufs, 1, -1 do
    if not M.buf_is_valid(bufs[i]) then
      table.remove(bufs, i)
    end
  end

  return bufs
end

M.tabufline_next = function()
  local bufs = M.bufilter() or {}

  for i, v in ipairs(bufs) do
    if vim.api.nvim_get_current_buf() == v then
      vim.cmd(i == #bufs and "b" .. bufs[1] or "b" .. bufs[i + 1])
      break
    end
  end
end

M.tabufline_prev = function()
  local bufs = M.bufilter() or {}

  for i, v in ipairs(bufs) do
    if vim.api.nvim_get_current_buf() == v then
      vim.cmd(i == 1 and "b" .. bufs[#bufs] or "b" .. bufs[i - 1])
      break
    end
  end
end

M.close_buffer = function(bufnr)
  if vim.bo.buftype == "terminal" then
    vim.cmd(vim.bo.buflisted and "set nobl | enew" or "hide")
  else
    bufnr = bufnr or vim.api.nvim_get_current_buf()
    require("ui.components.tabuffline").tabufline_prev()
    vim.cmd("confirm bd" .. bufnr)
  end
end

M.close_all_buffers = function(action)
  local bufs = vim.t.bufs

  if action == "closeTab" then
    vim.cmd("tabclose")
  end

  for _, buf in ipairs(bufs) do
    M.close_buffer(buf)
  end

  if action ~= "closeTab" then
    vim.cmd("enew")
  end
end

M.move_buf = function(n)
  local bufs = vim.t.bufs

  for i, bufnr in ipairs(bufs) do
    if bufnr == vim.api.nvim_get_current_buf() then
      if n < 0 and i == 1 or n > 0 and i == #bufs then
        bufs[1], bufs[#bufs] = bufs[#bufs], bufs[1]
      else
        bufs[i], bufs[i + n] = bufs[i + n], bufs[i]
      end
      break
    end
  end
  vim.t.bufs = bufs
  util.refresh()
end

M.setup = function()
  local modules = require("ui.components.tabuffline.modules")
  local result = modules.bufferlist() .. (modules.tablist() or "") .. modules.buttons()
  return (vim.g.nvimtree_side == "left") and modules.offset_tree() .. result or result .. modules.offset_tree()
end

return M
