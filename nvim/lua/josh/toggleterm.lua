local ok, toggleterm = pcall(require, 'toggleterm')

if ok then
  toggleterm.setup({
    direction = 'float',
    open_mapping = [[<c-\>]],
    float_opts = { border = 'curved' },
  })
end
