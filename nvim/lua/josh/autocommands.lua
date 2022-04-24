vim.cmd(
  [[
    augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank({higroup="IncSearch", timeout=250})
    augroup end
  ]],
  false
)

vim.cmd(
  [[
    augroup markdown
      autocmd!
      autocmd FileType markdown setlocal wrap
      autocmd FileType markdown setlocal spell
    augroup end
  ]],
  false
)
