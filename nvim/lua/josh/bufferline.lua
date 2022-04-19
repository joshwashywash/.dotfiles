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
    { 'gT', ':BufferLineCyclePrev<cr>' },
    { 'gt', ':BufferLineCycleNext<cr>' },
  }

  for _, keymap in ipairs(keymaps) do
    local from, to = unpack(keymap)
    vim.keymap.set('n', from, to, { noremap = true, silent = true })
  end
end
