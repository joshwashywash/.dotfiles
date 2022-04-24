local toggleterm = require('toggleterm')

toggleterm.setup({
  direction = 'float',
  open_mapping = [[<c-\>]],
  float_opts = { border = 'curved' },
})

local keymaps = {
  -- go into normal mode
  { '<esc>', [[<c-\><c-n>]] },
  { '<c-[>', [[<c-\><c-n>]] },

  -- navigate windows while leaving terminal open
  { '<c-h>', [[<c-\><c-n><c-w>k]] },
  { '<c-j>', [[<c-\><c-n><c-w>h]] },
  { '<c-k>', [[<c-\><c-n><c-w>j]] },
  { '<c-l>', [[<c-\><c-n><c-w>l]] },
}

function _G.set_terminal_keymaps()
  for _, keymap in ipairs(keymaps) do
    local from, to = unpack(keymap)
    vim.keymap.set('t', from, to, { noremap = true })
  end
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
