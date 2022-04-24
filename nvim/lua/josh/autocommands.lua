local cmds = {
  TextYankPost = {
    callback = function()
      vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
    end,
  },
  VimResized = {
    callback = function()
      vim.cmd('tabo wincmd =')
    end,
  },
}

for k, v in pairs(cmds) do
  vim.api.nvim_create_autocmd(k, v)
end

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
