vim.api.nvim_exec(
  [[
    augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=250})
    augroup end
  ]],
  false
)

vim.api.nvim_exec(
  [[
    augroup markdown
      autocmd!
      autocmd FileType markdown setlocal wrap
      autocmd FileType markdown setlocal spell
    augroup end
  ]],
  false
)
