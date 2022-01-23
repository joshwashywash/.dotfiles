local ok, lualine = pcall(require, 'lualine')

if ok then
  lualine.setup({
    options = {
      component_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
      theme = 'dracula',
    },
  })
end
