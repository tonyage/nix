local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.colorscheme = "dusk"

opt.autoindent = true
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.cursorcolumn = true
opt.cursorline = true
opt.laststatus = 3

opt.hlsearch = true
opt.incsearch = true
opt.linebreak = true
opt.swapfile = false
opt.textwidth = 99
opt.virtualedit = "block"
opt.wrap = true
opt.showmode = false

opt.signcolumn = "yes"
opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.ruler = false

opt.mouse = "a"
opt.mousemoveevent = true

opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true

opt.backup = false
opt.writebackup = false

opt.list = true
opt.listchars:append "eol:↴"
opt.updatetime = 300
opt.cmdheight = 1
opt.whichwrap:append "<>[]hl"

opt.fillchars = {
  vert = "▕",
  eob = " ",
  vertright = "▕",
}

local disabled_plugins = {
  "netrw",
  "netrwPlugin"
}

for _, plugin in pairs(disabled_plugins) do
  g[ "loaded_" .. plugin ] = 1
end

