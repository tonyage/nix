require("ui.themer").load()

vim.op.statusline = "%!v:lua.require('ui.statusline').setup()"
require("ui.tabline.lazy")({ lazyload = true })
require("ui.winbar")
