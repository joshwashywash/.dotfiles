local ok, lsp_installer = pcall(require, 'nvim-lsp-installer')

if ok then
  vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = true,
    virtual_text = false,
  })

  local orig_floating_preview = vim.lsp.util.open_floating_preview
  function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
    opts = opts or {}
    opts.border = 'rounded'
    return orig_floating_preview(contents, syntax, opts, ...)
  end

  local function on_attach(client, bufnr)
    if client.resolved_capabilities.document_highlight then
      vim.cmd([[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]])
    end
    vim.api.nvim_buf_set_keymap(
      bufnr,
      'n',
      'h',
      '<cmd>lua vim.lsp.buf.hover()<cr>',
      { noremap = true, silent = true }
    )
  end

  local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )

  lsp_installer.on_server_ready(function(server)
    local opts = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    local _ok, settings = pcall(
      require,
      string.format('josh.langservers.%s', server.name)
    )

    if _ok then
      opts.settings = settings
    end

    server:setup(opts)
  end)
end
