require("ui.themer").highlight("git")
local key = require("mappings")
local config = {
  on_attach = function(bufnr) 
    local gs = package.loaded.gitsigns
    key.map("n", "gcn", function()
      if vim.wo.diff then return "gcn" end
      vim.schedule(function() gs.next_hunk() end)
      return "<Ignore>"
    end, { expr = true, buffer = bufnr })
    key.map("n", "gcb", function()
      if vim.wo.diff then return "gcb" end
      vim.schedule(function() gs.prev_hunk() end)
      return "<Ignore>"
    end, { expr = true, buffer = bufnr })
    key.map("n", "grh", function() gs.reset_hunk() end)
    key.map("n", "gph", function() gs.preview_hunk() end)
    key.map("n", "gbl", function() gs.blame_line({ full = true }) end)
    key.map("n", "gtd", function() gs.toggle_deleted() end)
  end
}
require("gitsigns").setup(config)
