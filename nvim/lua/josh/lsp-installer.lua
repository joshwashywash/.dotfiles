local lsp_installer = require('nvim-lsp-installer')

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
  K = vim.lsp.buf.hover,
  Rn = vim.lsp.buf.rename,
  gD = vim.lsp.buf.declaration,
  gK = vim.lsp.buf.signture_help,
  gc = vim.lsp.buf.code_action,
  gd = vim.lsp.buf.definition,
  gr = vim.lsp.buf.references,
  gy = vim.lsp.buf.type_definition,
}

for k, v in pairs(keymaps) do
  vim.keymap.set('n', k, v)
end

local function on_attach(client, bufnr)
  client.offset_encoding = 'utf-16' -- null-ls does not allow multiple encodings and defaults to utf-16

  client.resolved_capabilities.document_formatting = false -- let null ls handle formatting
  if client.resolved_capabilities.document_highlight then
    for k, v in pairs({
      CursorHold = vim.lsp.buf.document_highlight,
      CursorMoved = vim.lsp.buf.clear_references,
    }) do
      vim.api.nvim_create_autocmd(k, {
        callback = v,
        buffer = bufnr,
      })
    end
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

  local _ok, extra_opts = pcall(
    require,
    string.format('josh.langservers.%s', server.name)
  )

  if _ok then
    opts = vim.tbl_extend('keep', opts, extra_opts)
  end

  server:setup(opts)
end)
