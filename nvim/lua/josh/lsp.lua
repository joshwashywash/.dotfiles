local illuminate = require('illuminate')
local lspinstaller = require('nvim-lsp-installer')

lspinstaller.setup()

local lspconfig = require('lspconfig')

vim.diagnostic.config({
  severity_sort = true,
  update_in_insert = true,
  virtual_text = false,
})

local keymaps = {
  K = vim.lsp.buf.hover,
  Rn = vim.lsp.buf.rename,
  gD = vim.lsp.buf.declaration,
  gK = vim.lsp.buf.signture_help,
  gC = vim.lsp.buf.code_action,
  gd = vim.lsp.buf.definition,
  gr = vim.lsp.buf.references,
  gy = vim.lsp.buf.type_definition,
}

local disable_formatting_clients = {
  'ccls',
  'emmet_ls',
  'html',
  'jsonls',
  'sumneko_lua',
  'svelte',
  'tsserver',
}

local capablitilies = require('cmp_nvim_lsp').update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

local function on_attach(client, bufnr)
  -- 0.8 use the new lsp.buffer filter api
  if vim.tbl_contains(disable_formatting_clients, client.name) then
    client.resolved_capabilities.document_formatting = false -- 0.7 and earlier
  end

  illuminate.on_attach(client)

  for k, v in pairs(keymaps) do
    vim.keymap.set('n', k, v, { buffer = bufnr })
  end
end

for _, server in ipairs(lspinstaller.get_installed_servers()) do
  local opts = {
    capabilities = capablitilies,
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
