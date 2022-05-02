local cmp = require('cmp')
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local lspkind = require('lspkind')

local offset = 4

cmp.setup({
  formatting = {
    format = lspkind.cmp_format({
      with_text = false,
      maxwidth = 50,
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ['<c-b>'] = cmp.mapping.scroll_docs(-offset),
    ['<c-e>'] = cmp.mapping.abort(),
    ['<c-f>'] = cmp.mapping.scroll_docs(offset),
    ['<c-space>'] = cmp.mapping.complete(),
    -- ['<cr>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body) -- For `vsnip` users.
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  }),
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' },
  },
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' },
  }, {
    { name = 'cmdline' },
  }),
})

cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done({ map_char = { tex = '' } })
)
