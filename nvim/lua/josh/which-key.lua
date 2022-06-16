local bufdelete = require('bufdelete')
local gitsigns = require('gitsigns.actions')
local lsp_installer = require('nvim-lsp-installer')
local neogit = require('neogit')
local nvimtree = require('nvim-tree')
local packer = require('packer')
local telescope = require('telescope.builtin')
local trouble = require('trouble')
local wk = require('which-key')

wk.register({
  F = { vim.lsp.buf.formatting_sync, 'format' },
  H = {
    function()
      vim.cmd('set hls!')
    end,
    'toggle highlight',
  },
  b = {
    name = 'buffer actions',
    d = {
      function()
        bufdelete.bufdelete(0)
      end,
      'delete',
    },
    w = {
      function()
        bufdelete.bufwipeout(0)
      end,
      'wipeout',
    },
  },
  e = {
    name = 'explorer',
    e = { nvimtree.toggle, 'toggle' },
    f = {
      function()
        nvimtree.find_file(true)
      end,
      'find file',
    },
  },
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
    N = {
      function()
        neogit.refresh_manually()
        neogit.open()
      end,
      'neogit',
    },
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
  l = {
    name = 'lsp',
    I = { lsp_installer.info_window.open, 'install info' },
    i = { require('lspconfig.ui.lspinfo'), 'info' },
  },
  p = {
    name = 'packer',
    S = { packer.status, 'status' },
    s = { packer.sync, 'sync' },
  },
  q = {
    function()
      vim.cmd(':q')
    end,
    'quit',
  },
  s = {
    name = 'split',
    s = {
      function()
        vim.cmd('split')
      end,
      'horizontally',
    },
    v = {
      function()
        vim.cmd('vsplit')
      end,
      'vertically',
    },
  },
  t = {
    name = 'trouble',
    D = {
      function()
        trouble.toggle('document_diagnostics')
      end,
      'document diagnostics',
    },
    d = {
      function()
        trouble.toggle('lsp_definitions')
      end,
      'definitions',
    },
    l = {
      function()
        trouble.toggle('loclist')
      end,
      'loclist',
    },
    q = {
      function()
        trouble.toggle('quickfix')
      end,
      'quickfix',
    },
    r = {
      function()
        trouble.toggle('lsp_references')
      end,
      'references',
    },
    t = { trouble.toggle, 'toggle' },
    w = {
      function()
        trouble.toggle('workspace_diagnostics')
      end,
      'workspace diagnostics',
    },
    y = {
      function()
        trouble.toggle('lsp_type_definitions')
      end,
      'type definitions',
    },
  },
  w = {
    function()
      vim.cmd(':w')
    end,
    'write',
  },
}, { prefix = '<leader>' })
