require('nvim-treesitter.configs').setup({
  ensure_installed = {
    'c',
    'css',
    'dockerfile',
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
