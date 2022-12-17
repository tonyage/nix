require("ui.themer").highlight("telescope")
local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local key = require("mappings")
local windows = require("ui.windows")
local extensions_list = { "fzf", "themes", "terms" }
local config = {
  defaults = {
    layout_strategy = "center",
    layout_config = {
      center = {
        width = 0.5,
      },
    },
    borderchars = windows.rounded_borders,
    mappings = {
      n = {
        ["<Esc>"] = actions.close,
      },
    },
    prompt_prefix = "   ",
    file_ignore_patterns = { "^node_modules/", "^__pycache__/" },
    path_display = {
      "smart",
      shorten = { len = 1, exclude = { 1, -1 }},
    },
    set_env = { ["COLORTERM"] = "truecolor" },
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
      -- find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
  },
}

telescope.setup(config)
pcall(function()
  for _, extension in pairs(extensions_list) do
    telescope.load_extension(extension)
  end
end)

key.map("n", "<leader>sf", function()
  builtin.find_files({ all = true })
end)
key.map("n", "<leader>sgf", builtin.git_files)
key.map("n", "<leader>scm", builtin.git_commits)
key.map("n", "<leader>gs", builtin.git_status)
key.map("n", "<leader>sof", builtin.oldfiles)

key.map("n", "grg", function()
  builtin.grep_string({ search = vim.fn.input(" ")})
end)
