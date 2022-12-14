require("ui.themer").highlight("telescope")
local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
-- local key = require("mappings")
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
        ["<Esc>"] = actions.close,
        ["<S><S>"] = builtin.find_files,
        ["grg"] = builtin.live_grep,
        ["gcm"] = builtin.git_commits,
        ["gs"] = builtin.git_status,
        ["gof"] = builtin.oldfiles,
      },
    }
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      -- find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
  },
}

-- key.map("n", "<Esc>", require("telescope.actions").close)
-- key.map("n", "<S><S>", require("telescope.builtin").find_files)
-- key.map("n", "grg", require("telescope.builtin").live_grep)
-- key.map("n", "gcm", require("telescope.builtin").git_commits)
-- key.map("n", "gs", require("telescope.builtin").git_status)
-- key.map("n", "gof", require("telescope.builtin").oldfiles)

telescope.setup(config)
pcall(function() 
  for _, extension in pairs(extensions_list) do
    telescope.load_extension(extension)
  end
end)
