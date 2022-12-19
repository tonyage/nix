require("ui.themer").highlight("treesitter")

local parser_install_dir = vim.fn.stdpath("cache") .. "/treesitter"
vim.fn.mkdir(parser_install_dir, "p")
vim.opt.runtimepath:append(parser_install_dir)

local config = {
  parser_install_dir = parser_install_dir,
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

