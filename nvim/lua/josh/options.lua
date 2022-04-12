local opts = {
  background = 'dark',
  clipboard = 'unnamedplus',
  cursorline = true,
  expandtab = true,
  fileencoding = 'utf-8',
  guifont = 'monospace:h16',
  hidden = true,
  ignorecase = true,
  mouse = 'a',
  number = true,
  pumheight = 8,
  relativenumber = true,
  scrolloff = 4,
  shiftwidth = 2,
  showmode = false,
  showtabline = 2,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  timeoutlen = 500,
  updatetime = 300,
  wrap = false,
  writebackup = false,
}

for k, v in pairs(opts) do
  vim.opt[k] = v
end
