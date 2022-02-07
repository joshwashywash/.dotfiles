local ok, null_ls = pcall(require, 'null-ls')

if ok then
  null_ls.setup({
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd([[
          augroup LspFormatting
            autocmd! * <buffer>
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
          augroup END
        ]])
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
    },
  })
end
