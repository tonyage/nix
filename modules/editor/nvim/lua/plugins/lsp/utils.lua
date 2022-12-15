local M = {}

M.async_format = function(bufnr)
    bufnr = bufnr or vim.api.nvim_get_current_buf()

    vim.lsp.buf_request(
      bufnr,
      "textDocument/formatting",
      vim.lsp.util.make_formatting_params({}),
      function(err, res, ctx)
          if err then
              local err_msg = type(err) == "string" and err or err.message
              -- you can modify the log message / level (or ignore it completely)
              vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
              return
          end

          -- don't apply results if buffer is unloaded or has been modified
          if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
              return
          end

          if res then
              local client = vim.lsp.get_client_by_id(ctx.client_id)
              vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
              vim.api.nvim_buf_call(bufnr, function()
                  vim.cmd("silent noautocmd update")
              end)
          end
      end
    )
end

M.lsp = function()
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

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
  })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
    focusable = false,
    relative = "cursor",
  })

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

  -- Borders for LspInfo winodw
  local win = require "lspconfig.ui.windows"
  local _default_opts = win.default_opts

  win.default_opts = function(options)
    local opts = _default_opts(options)
    opts.border = "single"
    return opts
  end
end

return M
