local null_ls = require('null-ls')

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.resolved_capabilities.document_formatting then
      vim.api.nvim_create_autocmd('BufWritePre', {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.formatting_sync()
        end,
      })
    end
  end,
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.php,
    null_ls.builtins.formatting.phpcsfixer,
    null_ls.builtins.formatting.prettier.with({
      extra_filetypes = { 'svelte', 'toml' },
    }),
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.clang_format,
  },
})
