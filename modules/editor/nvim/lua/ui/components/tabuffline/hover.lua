local delay = 500
local timer = nil
local previous_buffer = nil

local M = {}

local function on_hover(current_buffer)
  if current_buffer.screenrow == 1 then
    vim.api.nvim_exec_autocmds("User", {
      pattern = "BufferLineHoverOver",
      data = { cursor_pos = current_buffer.screencol }
    })
  elseif previous_buffer and previous_buffer.screenrow == 1 and current_buffer.screenrow ~=1 then
    vim.api.nvim_exec_autocmds("User", {
      pattern = "BufferLineHoverOut",
      data = {}
    })
  end
  previous_buffer = current_buffer
end

M.setup = function(config)
  local options = config.options.hover
  if not options.enabled or vim.version().minor < 8 or not vim.o.mousemoveevent then return end
  delay = options.delay or delay
  vim.keymap.set({ "",  }, "<MouseMove>", function()
    if timer then timer:close() end
    timer = vim.defer_fn(function()
      timer = nil
      local ok, position = pcall(vim.fn.getmousepos)
      if not ok then return end
      on_hover(position)
    end, delay)
    return "<MouseMove>"
  end, { expr = true })
  vim.api.nvim_create_autocmd("VimLeavePre", {
    group = vim.api.nvim_create_augroup("BufferLineHover", { clear = true }),
    callback = function()
      if timer then
        timer:close()
        timer = nil
      end
    end
  })
end

return M

