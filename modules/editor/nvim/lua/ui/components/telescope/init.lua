require("ui.themer").highlight("telescope")
local telescope = require("telescope")
local map = require("mappings")
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
      n = {
        ["<Esc>"] = require("telescope.actions").close,
        ["<S><S>"] = require("telescope.builtins").find_files,
      }
    },
  },
}

map("n", "<Esc>", require("telescope.actions").close)
map("n", "<S><S>", require("telescope.builtins").find_files, { find_command = "rg", follow = true, no_ignore = true, hidden = true })
map("n", "grg", require("telescope.builtins").live_grep)
map("n", "gcm", require("telescope.builtins").git_commits)
map("n", "gs", require("telescope.builtins").git_status)
map("n", "gof", require("telescope.builtins").oldfiles)

telescope.setup(config)
pcall(function() 
  for _, extension in pairs(extensions_list) do
    telescope.load_extension(extension)
  end
end)
