return {
  'cbochs/grapple.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    scope = 'git_branch',
  },
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  keys = {
    { '<leader>gm', function() require('grapple').toggle() end, desc = '[G]rapple [M]ark line' },
    { '<leader>gg', function() require('grapple').toggle_tags() end, desc = '[G]rapple menu' },
    { '<leader>gn', function() require('grapple').cycle_tags 'next' end, desc = '[G]rapple [N]ext' },
    { '<leader>gp', function() require('grapple').cycle_tags 'prev' end, desc = '[G]rapple [P]rev' },

    { '<leader>g1', function() require('grapple').select { index = 1 } end, desc = 'Grapple mark 1' },
    { '<leader>g2', function() require('grapple').select { index = 2 } end, desc = 'Grapple mark 2' },
    { '<leader>g3', function() require('grapple').select { index = 3 } end, desc = 'Grapple mark 3' },
    { '<leader>g4', function() require('grapple').select { index = 4 } end, desc = 'Grapple mark 4' },
  },
}
