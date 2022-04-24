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
  {
    'gT',
    function()
      bufferline.cycle(-1)
    end,
  },
  {
    'gt',
    function()
      bufferline.cycle(1)
    end,
  },
}

for _, keymap in ipairs(keymaps) do
  local from, to = unpack(keymap)
  vim.keymap.set('n', from, to, { noremap = true, silent = true })
end
