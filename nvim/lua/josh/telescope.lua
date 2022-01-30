local ok, telescope = pcall(require, 'telescope')

if ok then
  local actions = require('telescope.actions')
  local _ok, trouble = pcall(require, 'trouble.providers.telescope')

  if _ok then
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ['<c-h>'] = actions.move_selection_previous,
            ['<c-k>'] = actions.move_selection_next,
            ['<c-t>'] = trouble.open_with_trouble,
          },
          n = {
            ['<c-t>'] = trouble.open_with_trouble,
            h = actions.move_selection_previous,
            k = actions.move_selection_next,
          },
        },
      },
    })
  end
end
