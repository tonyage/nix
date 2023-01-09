local default_servers = { "bashls", "cmake", "cssls", "dockerls", "gopls", "html", "ltex", "rnix", "nil_ls", "bufls", "pyright", "texlab", "tsserver" }
local lspconfig = require("lspconfig")
local config = require("lsp.config")

require("lsp.sumneko")
require("lsp.rust")
require("lsp.yamlls")
require("lsp.null-ls")
require("fidget").setup()

for _, server in ipairs(default_servers) do
  lspconfig[server].setup({
    on_attach = config.on_attach,
    capabilities = config.capabilities,
  })
end

