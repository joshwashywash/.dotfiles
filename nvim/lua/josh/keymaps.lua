vim.g.mapleader = ' '

local common_keymaps = {
  { 'Y', 'y$' },
  { 'h', 'k' },
  { 'j', 'h' },
  { 'k', 'j' },
}

local normal_mode_keymaps = {
  -- resize window
  { '<c-down>', ':resize -2<cr>' },
  { '<c-left>', ':vertical resize -2<cr>' },
  { '<c-right>', ':vertical resize +2<cr>' },
  { '<c-up>', ':resize +2<cr>' },

  -- navigate windows
  { '<c-h>', '<c-w>k' },
  { '<c-j>', '<c-w>h' },
  { '<c-k>', '<c-w>j' },
  { '<c-l>', '<c-w>l' },

  -- move text up and down
  { '<a-h>', ':m .-2<cr>==' },
  { '<a-k>', ':m .+1<cr>==' },
}

local visual_mode_keymaps = {
  -- move text up and down
  { '<a-h>', ':m \'<-2<cr>gv=gv' },
  { '<a-k>', ':m \'>+1<cr>gv=gv' },

  { 'p', '"_dP' },

  -- keep cursor in same spot on yank
  { 'y', 'ygv<esc>' },

  -- keep selection on indent
  { '<', '<gv' },
  { '>', '>gv' },
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
