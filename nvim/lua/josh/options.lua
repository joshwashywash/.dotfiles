local opts = {
  background = 'dark',
  clipboard = 'unnamedplus',
  completeopt = { 'menuone', 'noselect' },
  guifont = 'monospace:h16',
  hidden = true,
  ignorecase = true,
  mouse = 'a',
  number = true,
  pumheight = 10,
  relativenumber = true,
  scrolloff = 4,
  shiftwidth = 2,
  showmode = false,
  showtabline = 2,
  signcolumn = 'yes',
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  timeoutlen = 500,
  updatetime = 250,
  writebackup = false,
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
