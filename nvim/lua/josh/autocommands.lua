local cmds = {
  TextYankPost = {
    callback = function()
      vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 200 })
    end,
  },
  FileType = {
    callback = function()
      for _, v in pairs({ 'wrap', 'spell' }) do
        vim.opt_local[v] = true
      end
    end,
    pattern = 'markdown',
  },
}

for k, v in pairs(cmds) do
  vim.api.nvim_create_autocmd(k, v)
end
