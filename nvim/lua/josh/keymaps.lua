vim.g.mapleader = ' '

local common_keymaps = {
  { 'F', 'H' }, -- up to top
  { 'H', 'J' }, -- join line below
  { 'J', 'T' }, -- just before backewards
  { 'K', 'R' }, -- replace mode
  { 'L', 'F' }, -- locate back
  { 'R', '^' }, -- move to start of line
  { 'S', 'L' }, -- down to bottom
  { 'T', '$' }, -- move to end of line
  { 'Y', 'y$' }, -- yank to end of line
  { 'f', 'k' }, -- up
  { 'h', 'K' }, -- show help
  { 'j', 't' }, -- just before
  { 'k', 'r' }, -- replace
  { 'l', 'f' }, -- locate
  { 'r', 'h' }, -- left
  { 's', 'j' }, -- down
  { 't', 'l' }, -- right
}

local normal_mode_keymaps = {
  -- resize window
  { '<c-down>', ':resize -2<cr>' },
  { '<c-left>', ':vertical resize -2<cr>' },
  { '<c-right>', ':vertical resize +2<cr>' },
  { '<c-up>', ':resize +2<cr>' },

  -- navigate windows
  { '<c-f>', '<c-w>k' },
  { '<c-r>', '<c-w>h' },
  { '<c-s>', '<c-w>j' },
  { '<c-t>', '<c-w>l' },

  -- move text up and down
  { '<a-s>', ':m .+1<cr>==' },
  { '<a-f>', ':m .-2<cr>==' },
}

local visual_mode_keymaps = {
  -- move text up and down
  { '<a-f>', ':m \'<-2<cr>gv=gv' },
  { '<a-s>', ':m \'>+1<cr>gv=gv' },

  { 'p', '"_dP' },

  -- keep cursor in same spot on yank
  { 'y', 'ygv<esc>' },

  -- keep selection on indent
  { '<', '<gv' },
  { '>', '>gv' },
}

local insert_mode_keymaps = {
  { 'tn', '<esc>' },
}

local operator_mode_keymaps = {}

-- extend a with b
local function extend(a, b)
  table.move(b, 1, #b, #a + 1, a)
end

for _, keymap in ipairs({
  normal_mode_keymaps,
  operator_mode_keymaps,
  visual_mode_keymaps,
}) do
  extend(keymap, common_keymaps)
end

local maps = {
  i = insert_mode_keymaps,
  n = normal_mode_keymaps,
  o = operator_mode_keymaps,
  v = visual_mode_keymaps,
}

local function map_keys(mode, keymaps, opts)
  for _, keymap in ipairs(keymaps) do
    local from, to = unpack(keymap)
    vim.api.nvim_set_keymap(mode, from, to, opts)
  end
end

for mode, keymaps in pairs(maps) do
  map_keys(mode, keymaps, { noremap = true, silent = true })
end
