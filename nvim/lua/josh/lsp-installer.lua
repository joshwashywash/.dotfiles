local lsp_signature = require('lsp_signature')
local lspinstaller = require('nvim-lsp-installer')
local illuminate = require('illuminate')

lspinstaller.setup()

local lspconfig = require('lspconfig')

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

local disable_formatting_clients = {
  'ccls',
  'html',
  'jsonls',
  'sumneko_lua',
  'svelte',
  'tsserver',
}

local function on_attach(client, bufnr)
  client.offset_encoding = 'utf-16'

  -- 0.8 use the new lsp.buffer filter api
  if vim.tbl_contains(disable_formatting_clients, client.name) then
    client.resolved_capabilities.document_formatting = false -- 0.7 and earlier
  end

  illuminate.on_attach(client)

  lsp_signature.on_attach({
    bind = true,
    handler_opts = { border = 'rounded' },
  }, bufnr)

  for k, v in pairs(keymaps) do
    vim.keymap.set('n', k, v, { buffer = bufnr })
  end
end

for _, server in ipairs(lspinstaller.get_installed_servers()) do
  local opts = {
    capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    ),
    on_attach = on_attach,
  }

  local _ok, extra_opts = pcall(
    require,
    string.format('josh.langservers.%s', server.name)
  )
  if _ok then
    opts = vim.tbl_extend('keep', opts, extra_opts)
  end
  lspconfig[server.name].setup(opts)
end
