local ok, trouble = pcall(require, 'trouble')

if ok then
  trouble.setup({
    action_keys = {
      next = 's',
      open_split = { '<c-h>' },
      previous = 'f',
      refresh = { '<c-r>' },
    },
  })
end
