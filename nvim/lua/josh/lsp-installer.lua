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

  local function cc(command)
    return string.format('<cmd>%s<cr>', command)
  end

  local keymaps = {
    { 'K', 'lua vim.lsp.buf.hover()' },
    { 'Rn', 'lua vim.lsp.buf.rename()' },
    { 'gD', 'lua vim.lsp.buf.declaration()' },
    { 'gK', 'lua vim.lsp.buf.signature_help()' },
    { 'gca', 'lua vim.lsp.buf.code_action()' },
    { 'gd', 'lua vim.lsp.buf.definition()' },
    { 'gr', 'lua vim.lsp.buf.references()' },
    { 'gt', 'lua vim.lsp.buf.type_definition()' },
  }

  local function on_attach(client, bufnr)
    for _, keymap in ipairs(keymaps) do
      local from, to = unpack(keymap)
      vim.api.nvim_buf_set_keymap(
        bufnr,
        'n',
        from,
        cc(to),
        { noremap = true, silent = true }
      )
    end

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
