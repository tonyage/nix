local map = require("mappings")
local M = {}

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true, buffer = bufnr }

  map("n", "gD", vim.lsp.buf.declaration(), opts)
  map("n", "gd", vim.lsp.buf.definition(), opts)
  map("n", "gk", vim.lsp.buf.hover(), opts)
  map("n", "gi", vim.lsp.buf.implementation(), opts)
  map("n", "gr", vim.lsp.buf.references(), opts)
  map("n", "gs", vim.lsp.buf.signature_help(), opts)
  map("n", "gt", vim.lsp.buf.type_definition(), opts)
  map("n", "grn", require("plugins.renamer").open(), opts)
  map("n", "<A><CR>", vim.lsp.buf.code_action(), opts)
  map("n", "gfm", vim.lsp.buf.format({ async = true }), opts)
  map("n", "<leader>o", vim.diagnostic.open_float(), { noremap = true, silent = true })
  map("n", "gn", vim.diagnostic.goto_next(), { noremap = true, silent = true })
  map("n", "gb", vim.diagnostic.goto_prev(), { noremap = true, silent = true })
  map("n", "gq", vim.diagnostic.setloclist(), { noremap = true, silent = true } )
  map("n", "gwa", vim.lsp.buf.add_workspace_folder(), opts)
  map("n", "gwr", vim.lsp.buf.remove_workspace_folder(), opts)
  map("n", "gwl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts)

  if client.server_capabilities.signatureHelpProvider then
    require("lsp.signature").setup(client)
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits"
    }
  }
}

return M

