local ok, wk = pcall(require, 'which-key')

local function cc(command)
  return string.format('<cmd>%s<cr>', command)
end

if ok then
  wk.register({
    c = { cc(':bdelete!'), 'close buffer' },
    e = {
      name = 'explorer',
      e = { cc('NvimTreeToggle'), 'toggle' },
      f = { cc('NvimTreeFindFile'), 'find file' },
    },
    F = { cc('lua vim.lsp.buf.formatting_sync()'), 'format' },
    f = {
      name = 'find',
      D = { cc('Telescope diagnostics'), 'diagnostics' },
      R = { cc('Telescope lsp_references'), 'references' },
      b = { cc('Telescope buffers'), 'buffers' },
      c = { cc('Telescope lsp_code_actions'), 'code actions' },
      d = { cc('Telescope lsp_definitions'), 'definitions' },
      f = { cc('Telescope find_files'), 'files' },
      g = { cc('Telescope live_grep'), 'grep' },
      h = { cc('Telescope help_tags'), 'help' },
      r = { cc('Telescope oldfiles'), 'recent files' },
      t = { cc('Telescope lsp_type_definitions'), 'type definitions' },
    },
    g = {
      name = 'git',
      B = { cc('Telescope git_branches'), 'branches' },
      C = { cc('Telescope git_bcommits'), 'buffer commits' },
      D = { cc('Gitsigns diffthis'), 'diff' },
      H = { cc('Gitsigns undo_stage_hunk'), 'undo stage hunk' },
      P = { cc('Gitsigns preview_hunk'), 'preview hunk' },
      R = { cc('Gitsigns reset_buffer'), 'reset buffer' },
      S = { cc('Telescope git_status'), 'status' },
      b = { cc('Gitsigns blame_line'), 'blame' },
      c = { cc('Telescope git_commits'), 'commits' },
      d = { cc('Gitsigns toggle_deleted'), 'toggle deleted' },
      h = { cc('Gitsigns stage_hunk'), 'stage hunk' },
      n = { cc('Gitsigns next_hunk'), 'next hunk' },
      p = { cc('Gitsigns prev_hunk'), 'previous hunk' },
      r = { cc('Gitsigns reset_hunk'), 'reset hunk' },
      s = { cc('Gitsigns stage_buffer'), 'stage buffer' },
      t = { cc('Telescope git_stash'), 'stash' },
    },
    h = { cc('nohl'), 'no highlight' },
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
      D = { cc('TroubleToggle document_diagnostics'), 'document diagnostics' },
      d = { cc('TroubleToggle lsp_definitions'), 'definitions' },
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
