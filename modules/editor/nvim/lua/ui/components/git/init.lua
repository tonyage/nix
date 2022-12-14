require("ui.themer").highlight("git")
local map = require("mappings")
local config = {
  on_attach = function(bufnr) 
    local gs = package.loaded.gitsigns
    map("n", "gcn", function()
      if vim.wo.diff then return "gcn" end
      vim.schedule(function() gs.next_hunk() end)
      return "<Ignore>"
    end, { expr = true })
    map("n", "gcb", function()
      if vim.wo.diff then return "gcb" end
      vim.schedule(function() gs.prev_hunk() end)
      return "<Ignore>"
    end, { expr = true })
    map("n", "grh", function() gs.reset_hunk() end)
    map("n", "gph", function() gs.preview_hunk() end)
    map("n", "gbl", function() gs.blame_line({ full = true }) end)
    map("n", "gtd", function() gs.toggle_deleted() end)
  end
}
require("gitsigns").setup(config)
