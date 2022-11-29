require("lspsaga").init_lsp_saga({
  border_style = "rounded",
  move_in_saga = { prev = "k", next = "j" },
  code_action_num_shortcut = true,
  code_action_keys = {
    quit = "<Esc>",
    exec = "<CR>",
  },
  symbol_in_winbar = {
    enable = true,
    show_file = true,
  },
})

require("lspsaga.diagnostic").show_line_diagnostics()
