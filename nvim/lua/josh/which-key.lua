local ok, wk = pcall(require, 'which-key')

local function cc(command)
  return string.format('<cmd>%s<cr>', command)
end

if ok then
  wk.setup()
  wk.register({
    F = { cc('lua vim.lsp.buf.formatting_sync()'), 'format' },
    c = { cc(':bd'), 'close' },
    e = { cc('NvimTreeToggle'), 'explorer' },
    f = {
      name = 'find',
      b = { cc('Telescope buffers'), 'buffers' },
      f = { cc('Telescope find_files'), 'files' },
      g = { cc('Telescope live_grep'), 'grep' },
      h = { cc('Telescope help_tags'), 'help' },
      r = { cc('Telescope oldfiles'), 'recent files' },
    },
    l = {
      name = 'lsp',
      I = { cc('LspInstallInfo'), 'install info' },
      i = { cc('LspInfo'), 'info' },
    },
    p = {
      name = 'packer',
      S = { cc('PackerStatus'), 'status' },
      c = { cc('PackerCompile'), 'compile' },
      i = { cc('PackerInstall'), 'install' },
      s = { cc('PackerSync'), 'sync' },
      u = { cc('PackerUpdate'), 'update' },
    },
    q = { cc('q'), 'quit' },
    t = {
      name = 'trouble',
      d = { cc('TroubleToggle document_diagnostics'), 'document diagnostics' },
      f = { cc('TroubleToggle lsp_definitions'), 'definitions' },
      l = { cc('TroubleToggle loclist'), 'loclist' },
      q = { cc('TroubleToggle quickfix'), 'quickfix' },
      r = { cc('TroubleToggle lsp_references'), 'lsp references' },
      t = { cc('TroubleToggle'), 'toggle' },
      w = {
        cc('TroubleToggle workspace_diagnostics'),
        'workspace diagnostics',
      },
      y = { cc('TroubleToggle lsp_type_definitions'), 'type definitions' },
    },
    w = { cc('w'), 'write file' },
  }, { prefix = '<leader>' })
end
