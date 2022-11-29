require("ui.themer").highlight("treesitter")

local config = {
  ensure_installed = { },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  auto_install = true,
  indent = { enable = true },
  refactor = { highlight_definitions = { enable = true } },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
          ["ab"] = "@block.outer",
          ["ib"] = "@block.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
      },
    },
    swap = {
      enable = true,
      swap_next = { ["<leader>sn"] = "@parameter.inner" },
      swap_previous = { ["<leader>sp"] = "@parameter.inner" }
    },
  },
}

require("nvim-treesitter.configs").setup(config)

