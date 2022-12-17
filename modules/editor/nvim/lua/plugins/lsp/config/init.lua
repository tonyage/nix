local key = require("mappings")
local windows = require("ui.windows")
local navic = require("nvim-navic")
local M = {}

key.map("n", "gof", vim.diagnostic.open_float, { noremap = true, silent = true })
key.map("n", "gn", vim.diagnostic.goto_next, { noremap = true, silent = true })
key.map("n", "gb", vim.diagnostic.goto_prev, { noremap = true, silent = true })
local function lspSymbol(name, icon)
  local hl = "DiagnosticSign" .. name
  vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
end

lspSymbol("Error", "")
lspSymbol("Info", "")
lspSymbol("Hint", "")
lspSymbol("Warn", "")

vim.diagnostic.config {
  virtual_text = {
    prefix = "",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
}

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, windows.not_focusable)
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, windows.not_focusable)

-- suppress error messages from lang servers
vim.notify = function(msg, log_level)
  if msg:match "exit code" then
    return
  end
  if log_level == vim.log.levels.ERROR then
    vim.api.nvim_err_writeln(msg)
  else
    vim.api.nvim_echo({ { msg } }, true, {})
  end
end

local win = require("lspconfig.ui.windows")

win.default_opts = windows.not_focusable

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true, buffer = bufnr }

  key.map("n", "gD", vim.lsp.buf.declaration, opts)
  key.map("n", "gd", vim.lsp.buf.definition, opts)
  key.map("n", "gk", vim.lsp.buf.hover, opts)
  key.map("n", "gi", vim.lsp.buf.implementation, opts)
  key.map("n", "gr", require("telescope.builtin").lsp_references, opts)
  key.map("n", "gsh", vim.lsp.buf.signature_help, opts)
  key.map("n", "gt", vim.lsp.buf.type_definition, opts)
  key.map("n", "grn", vim.lsp.buf.rename, opts)
  key.map("n", "<A><CR>", vim.lsp.buf.code_action, opts)
  key.map("n", "gfm", function() vim.lsp.buf.format({ async = true }) end, opts)
  key.map("n", "gwa", vim.lsp.buf.add_workspace_folder, opts)
  key.map("n", "gwr", vim.lsp.buf.remove_workspace_folder, opts)
  key.map("n", "gwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders))
  end, opts)

  if client.server_capabilities.signatureHelpProvider then
    require("plugins.lsp.signature").setup(client)
  end
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

return M

