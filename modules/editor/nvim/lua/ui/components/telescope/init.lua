require("ui.themer").highlight("telescope")
local telescope = require("telescope")
local extensions_list = { "fzf", "themes", "terms" }
local config = {
  defaults = {
    prompt_prefix = "   ",
    file_ignore_patterns = { "^node_modules/", "^__pycache__/" },
    path_display = { 
      "smart",
      shorten = { len = 1, exclude = { 1, -1 }},
    },
    set_env = { ["COLORTERM"] = "truecolor" },
    mappings = { 
      n = { ["<Esc>"] = require("telescope.actions").close }
    },
  },
}

telescope.setup(config)
pcall(function() 
  for _, extension in pairs(extensions_list) do
    telescope.load_extension(extension)
  end
end)
