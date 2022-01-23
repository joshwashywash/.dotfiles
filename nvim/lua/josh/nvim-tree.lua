local tree_cb = require('nvim-tree.config').nvim_tree_callback

-- key -> nvim function name
local keymaps = {
  { '..', 'dir_up' },
  { '<BS>', 'close_node' },
  { '<C-r>', 'refresh' },
  { '<C-y>', 'copy_absolute_path' },
  { '<CR>', 'edit' },
  { '?', 'toggle_help' },
  { 'D', 'trash' },
  { 'F', 'first_sibling' },
  { 'K', 'full_rename' },
  { 'P', 'parent_node' },
  { 'S', 'last_sibling' },
  { 'Y', 'copy_path' },
  { 'a', 'create' },
  { 'c', 'copy' },
  { 'd', 'remove' },
  { 'h', 'split' },
  { 'k', 'rename' },
  { 'o', 'system_open' },
  { 'p', 'paste' },
  { 'q', 'close' },
  { 'v', 'vsplit' },
  { 'x', 'cut' },
  { 'y', 'copy_name' },
}

local function create_entry(keymap)
  local key, cb_name = unpack(keymap)
  return { key = key, cb = tree_cb(cb_name) }
end

for i, keymap in ipairs(keymaps) do
  keymaps[i] = create_entry(keymap)
end

require('nvim-tree').setup({
  view = {
    mappings = {
      custom_only = true,
      list = keymaps,
    },
    width = 24,
  },
})
