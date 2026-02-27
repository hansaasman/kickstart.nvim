return {
  -- Treesitter textobjects: syntax-aware selections and motions
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('nvim-treesitter.configs').setup {
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ['af'] = { query = '@function.outer', desc = 'outer function' },
              ['if'] = { query = '@function.inner', desc = 'inner function' },
              ['ac'] = { query = '@class.outer', desc = 'outer class' },
              ['ic'] = { query = '@class.inner', desc = 'inner class' },
              ['aa'] = { query = '@parameter.outer', desc = 'outer argument' },
              ['ia'] = { query = '@parameter.inner', desc = 'inner argument' },
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              [']m'] = { query = '@function.outer', desc = 'Next function start' },
              [']]'] = { query = '@class.outer', desc = 'Next class start' },
            },
            goto_previous_start = {
              ['[m'] = { query = '@function.outer', desc = 'Prev function start' },
              ['[['] = { query = '@class.outer', desc = 'Prev class start' },
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ['<leader>a'] = { query = '@parameter.inner', desc = 'Swap with next parameter' },
            },
            swap_previous = {
              ['<leader>A'] = { query = '@parameter.inner', desc = 'Swap with previous parameter' },
            },
          },
        },
      }
    end,
  },

  -- Treesitter context: pins enclosing function/class at top of window
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      max_lines = 3,
    },
  },
}
