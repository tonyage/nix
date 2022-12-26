local lspconfig = require("lspconfig")
local config = require("lsp.config")

require("rust-tools").setup()
require("rust-tools").inlay_hints.enable()
require("crates").setup()

lspconfig.rust_analyzer.setup({
  on_attach = config.on_attach,
  capabilities = config.capabilities
})
