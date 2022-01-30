local ok, trouble = pcall(require, 'trouble')

if ok then
  trouble.setup({
    action_keys = {
      next = 'k',
      open_split = { '<c-s>' },
      open_vsplit = { '<c-v>' },
      previous = 'h',
      refresh = { '<c-r>' },
    },
  })
end
