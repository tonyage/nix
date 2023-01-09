local null = require("null-ls")
local utils = require("lsp.null-ls.utils")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null.setup({
  sources = {
    null.builtins.code_actions.gitsigns,

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
