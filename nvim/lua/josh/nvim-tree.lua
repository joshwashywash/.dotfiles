-- key -> nvim function name
local keymaps = {
  { '..', 'dir_up' },
  { '<bs>', 'close_node' },
  { '<c-c>', 'cd' },
  { '<c-r>', 'refresh' },
  { '<c-y>', 'copy_absolute_path' },
  { '<cr>', 'edit' },
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

local function create_keymap(keymap)
  local key, action = unpack(keymap)
  return { key = key, action = action }
end

local function map(f, tbl)
  local t = {}
  for k, v in pairs(tbl) do
    t[k] = f(v)
  end
  return t
end

require('nvim-tree').setup({
  view = {
    mappings = {
      custom_only = true,
      list = map(create_keymap, keymaps),
    },
    width = 24,
  },
})
