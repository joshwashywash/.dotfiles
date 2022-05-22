require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'c',
    'css',
    'dockerfile',
    'html',
    'javascript',
    'json',
    'lua',
    'svelte',
    'typescript',
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
