require("ui.themer").highlight("git")
local config = {
  on_attach = function(bufnr) 
    -- require("util").load_mappings("gitsigns", { buffer = bufnr })
  end,
}
require("gitsigns").setup(config)
