require("ui.themer").highlight("nvimtree")
local config = {
  open_on_setup = true;
  open_on_setup_file = true;
  update_focused_file = { enable = true, update_cwd = true },
  renderer = {
    highlight_git = false,
    highlight_opened_files = "all",

    indent_markers = {
      enable = false,
    },

    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = false,
      },

      glyphs = {
        default = "",
        symlink = "",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
          symlink_open = "",
          arrow_open = "",
          arrow_closed = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      }
    }
  }
}
require("nvim-tree").setup(config)
