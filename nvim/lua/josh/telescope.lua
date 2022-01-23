local ok, telescope = pcall(require, 'telescope')

if ok then
  local actions = require('telescope.actions')
  local ok, trouble = pcall(require, 'trouble.providers.telescope')

  if ok then
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ['<c-f>'] = actions.move_selection_previous,
            ['<c-h>'] = actions.select_horizontal,
            ['<c-s>'] = actions.move_selection_next,
            ['<c-v>'] = actions.select_vertical,
            ['<c-t>'] = trouble.open_with_trouble,
          },
          n = {
            f = actions.move_selection_previous,
            s = actions.move_selection_next,
            ['<c-t>'] = trouble.open_with_trouble,
          },
        },
      },
    })
  end
end
