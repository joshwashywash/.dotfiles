local packer = require('packer')

-- Automatically install packer
local install_path = vim.fn.stdpath('data')
  .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  vim.notify('Installing packer. Close and reopen Neovim...')
  vim.cmd([[packadd packer.nvim]])
end

local plugins = {
  { 'wbthomason/packer.nvim' },
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require('josh.toggleterm')
    end,
  },
  {
    'akinsho/bufferline.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
    },
    config = function()
      require('josh.bufferline')
    end,
  },
  { 'neovim/nvim-lspconfig' },
  {
    'kyazdani42/nvim-tree.lua',
    config = {
      function()
        require('josh.nvim-tree')
      end,
    },
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('josh.treesitter')
    end,
  },
  {
    'williamboman/nvim-lsp-installer',
    config = function()
      require('josh.lsp-installer')
    end,
  },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-cmdline' },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require('josh.cmp')
    end,
  },
  { 'hrsh7th/cmp-vsnip' },
  { 'hrsh7th/vim-vsnip' },
  {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require('josh.telescope')
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true,
    },
    config = function()
      require('josh.lualine')
    end,
  },
  { 'onsails/lspkind-nvim' },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
  },
  { 'folke/lsp-colors.nvim' },
  {
    'folke/trouble.nvim',
    config = function()
      require('josh.trouble')
    end,
    requires = 'kyazdani42/nvim-web-devicons',
  },
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      require('josh.null-ls')
    end,
  },
  {
    'lewis6991/gitsigns.nvim',
    config = {
      require('gitsigns').setup(),
    },
    requires = {
      'nvim-lua/plenary.nvim',
    },
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  },
  { 'b0o/schemastore.nvim' },
  {
    'iamcco/markdown-preview.nvim',
    run = 'cd app && npm install',
    ft = 'markdown',
  },
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end,
  },
  {
    'karb94/neoscroll.nvim',
    config = function()
      require('neoscroll').setup({ easing_function = 'sine' })
    end,
  },
  {
    'folke/which-key.nvim',
    config = function()
      require('josh.which-key')
    end,
  },
  {
    'dracula/vim',
    as = 'dracula',
  },
  {
    'savq/melange',
    as = 'melange',
    config = function()
      vim.cmd('colorscheme melange')
    end,
  },
  { 'machakann/vim-sandwich' },
}

return packer.startup({
  function()
    for _, plugin in ipairs(plugins) do
      packer.use(plugin)
    end
    if PACKER_BOOTSTRAP then
      packer.sync()
    end
  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'rounded' })
      end,
    },
  },
})
