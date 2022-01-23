local ok, bufferline = pcall(require, 'bufferline')

if ok then
  bufferline.setup({
    options = {
      offsets = {
        {
          filetype = 'NvimTree',
          text = 'explorer',
          highlight = 'Directory',
          text_align = 'center',
        },
      },
    },
  })
  --navigate buffers
  local keymaps = {
    { '<s-tab>', ':BufferLineCyclePrev<cr>' },
    { '<tab>', ':BufferLineCycleNext<cr>' },
  }

  for _, keymap in ipairs(keymaps) do
    local from, to = unpack(keymap)
    vim.api.nvim_set_keymap('n', from, to, { noremap = true, silent = true })
  end
end
