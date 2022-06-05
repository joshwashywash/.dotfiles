local bufferline = require('bufferline')

bufferline.setup({
  options = {
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'explorer',
        highlight = 'Directory',
        text_align = 'center',
      },
    },
  },
})

--navigate buffers
local keymaps = {
  ['gT'] = function()
    bufferline.cycle(-1)
  end,
  ['gt'] = function()
    bufferline.cycle(1)
  end,
}

for k, v in pairs(keymaps) do
  vim.keymap.set('n', k, v)
end
