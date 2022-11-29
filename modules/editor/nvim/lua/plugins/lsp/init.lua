local default_servers = { "bashls", "cmake", "cssls", "dockerls", "gopls", "html", "ltex", "nil_ls", "pyright", "tsserver" }
local lspconfig = require("lspconfig")
local null = require("null-ls")
local config = require("plugins.lsp.config")
local utils = require("plugins.lsp.utils")

-- require("lsp.saga")
require("plugins.lsp.sumneko")
require("plugins.lsp.rust")
require("fidget").setup()

for _, server in ipairs(default_servers) do
  lspconfig[server].setup({
    on_attach = config.on_attach,
    capabilities = config.capabilities,
  })
end


local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null.setup({
  sources = {
    null.builtins.formatting.markdownlint,
    null.builtins.diagnostics.markdownlint,

    null.builtins.formatting.black,
    null.builtins.formatting.isort,

    null.builtins.diagnostics.cppcheck,
    null.builtins.diagnostics.cpplint,

    null.builtins.formatting.prettier,

    null.builtins.code_actions.statix,
    null.builtins.diagnostics.statix,
    null.builtins.diagnostics.deadnix,

    null.builtins.formatting.ktlint,
    null.builtins.diagnostics.ktlint,

    null.builtins.code_actions.shellcheck,

    null.builtins.formatting.rustfmt,

    null.builtins.diagnostics.gitlint,
    null.builtins.diagnostics.hadolint,
    null.builtins.diagnostics.yamllint,
  },
  debug = false,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePost", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          utils.async_format(bufnr)
        end
      })
    end
  end,
})
