local M = {}

M.map = function(mode, lhs, rhs, opts)
  opts = opts or { noremap = true, silent = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

M.buffer_map = function(mode, lhs, rhs, opts)
  opts = vim.tbl_deep_extend("force", { noremap = true, silent = true }, opts or {})
  vim.api.nvim_buf_set_keymap(opts.buffer, mode, lhs, rhs, opts)
end

return M

