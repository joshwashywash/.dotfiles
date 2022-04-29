local nvimtree = require('nvim-tree')

-- key -> nvim function name
local keymaps = {
  { '..', 'dir_up' },
  { '<a-d>', 'cd' },
  { '<bs>', 'close_node' },
  { '<c-h>', 'toggle_dotfiles' }, -- hidden
  { '<c-r>', 'refresh' },
  { '<c-y>', 'copy_absolute_path' },
  { '<cr>', 'edit' },
  { '<tab>', 'preview' },
  { 'D', 'trash' },
  { 'H', 'first_sibling' },
  { 'I', 'toggle_ignored' },
  { 'K', 'last_sibling' },
  { 'P', 'parent_node' },
  { 'R', 'full_rename' },
  { 'Y', 'copy_path' },
  { 'a', 'create' },
  { 'c', 'copy' },
  { 'd', 'remove' },
  { 'g?', 'toggle_help' },
  { 'gn', 'next_git_item' },
  { 'gp', 'prev_git_item' },
  { 'o', 'system_open' },
  { 'p', 'paste' },
  { 'q', 'close' },
  { 'r', 'rename' },
  { 's', 'split' },
  { 'v', 'vsplit' },
  { 'x', 'cut' },
  { 'y', 'copy_name' },
}

local function create_keymap(keymap)
  local key, action = unpack(keymap)
  return { key = key, action = action }
end

nvimtree.setup({
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  view = {
    hide_root_folder = true,
    mappings = {
      custom_only = true,
      list = vim.tbl_map(create_keymap, keymaps),
    },
    side = 'right',
    width = 24,
  },
})
