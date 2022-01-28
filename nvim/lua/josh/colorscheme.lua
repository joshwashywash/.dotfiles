local colorscheme = 'melange'

local ok, _ = pcall(vim.cmd, string.format('colorscheme %s', colorscheme))

if not ok then
  vim.notify(string.format('colorscheme %s not found', colorscheme))
end
