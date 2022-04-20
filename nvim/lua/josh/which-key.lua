local ok, wk = pcall(require, 'which-key')

local function cc(command)
  return string.format('<cmd>%s<cr>', command)
end

if ok then
  local telescope = require('telescope.builtin')
  local gitsigns = require('gitsigns.actions')
  wk.register({
    c = { cc(':bd'), 'close buffer' },
    e = {
      name = 'explorer',
      e = { cc('NvimTreeToggle'), 'toggle' },
      f = { cc('NvimTreeFindFile'), 'find file' },
    },
    F = { vim.lsp.buf.formatting_sync, 'format' },
    f = {
      name = 'find',
      D = { telescope.diagnostics, 'diagnostics' },
      R = { telescope.lsp_references, 'references' },
      b = { telescope.buffers, 'buffers' },
      c = { telescope.lsp_code_actions, 'code actions' },
      d = { telescope.lsp_definitions, 'definitions' },
      f = {
        telescope.find_files,
        'files',
      },
      g = { telescope.live_grep, 'grep' },
      h = { telescope.help_tags, 'help' },
      l = { telescope.grep_string, 'grep string under cursor' },
      r = { telescope.oldfiles, 'recent files' },
      t = { telescope.lsp_type_definitions, 'type definitions' },
    },
    g = {
      name = 'git',
      B = { telescope.git_branches, 'branches' },
      C = { telescope.git_bcommits, 'buffer commits' },
      D = { gitsigns.diffthis, 'diff' },
      H = { gitsigns.undo_stage_hunk, 'undo stage hunk' },
      P = { gitsigns.preview_hunk, 'preview hunk' },
      R = { gitsigns.reset_buffer, 'reset buffer' },
      S = { telescope.git_status, 'status' },
      b = { gitsigns.blame_line, 'blame' },
      c = { telescope.git_commits, 'commits' },
      d = { gitsigns.toggle_deleted, 'toggle deleted' },
      h = { gitsigns.stage_hunk, 'stage hunk' },
      n = { gitsigns.next_hunk, 'next hunk' },
      p = { gitsigns.prev_hunk, 'previous hunk' },
      r = { gitsigns.reset_hunk, 'reset hunk' },
      s = { gitsigns.stage_buffer, 'stage buffer' },
      t = { telescope.git_stash, 'stash' },
    },
    h = { cc('set hls!'), 'toggle highlight' },
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
      D = {
        cc('TroubleToggle document_diagnostics'),
        'document diagnostics',
      },
      d = { cc('TroubleToggle lsp_definitions'), 'definitions' },
      l = { cc('TroubleToggle loclist'), 'loclist' },
      q = { cc('TroubleToggle quickfix'), 'quickfix' },
      r = { cc('TroubleToggle lsp_references'), 'references' },
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
