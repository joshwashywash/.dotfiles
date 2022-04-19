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

  local keymaps = {
    { 'K', vim.lsp.buf.hover },
    { 'Rn', vim.lsp.buf.rename },
    { 'gD', vim.lsp.buf.declaration },
    { 'gK', vim.lsp.buf.signature_help },
    { 'gca', vim.lsp.buf.code_action },
    { 'gd', vim.lsp.buf.definition },
    { 'gr', vim.lsp.buf.references },
    { 'gy', vim.lsp.buf.type_definition },
  }

  for _, keymap in ipairs(keymaps) do
    local from, to = unpack(keymap)
    vim.keymap.set('n', from, to, { noremap = true, silent = true })
  end

  local function on_attach(client, bufnr)
    client.offset_encoding = 'utf-16' -- null-ls does not allow multiple encodings and defaults to utf-16

    client.resolved_capabilities.document_formatting = false -- let null ls handle formatting
    if client.resolved_capabilities.document_highlight then
      vim.cmd([[
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]])
    end
  end

  local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
  )

  lsp_installer.on_server_ready(function(server)
    local opts = {
      capabilities = capabilities,
      on_attach = on_attach,
    }

    local _ok, _opts = pcall(
      require,
      string.format('josh.langservers.%s', server.name)
    )

    if _ok then
      for k, v in pairs(_opts) do
        opts[k] = v
      end
    end

    server:setup(opts)
  end)
end
