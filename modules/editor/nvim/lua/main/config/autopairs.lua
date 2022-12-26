local autopairs = require("nvim-autopairs")
local cmp = require("cmp")

local config = {
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt", "vim" },
  enable_check_bracket_line = true,
}
autopairs.setup(config)
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

