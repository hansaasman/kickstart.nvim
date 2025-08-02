-- Python LSP and tools setup
return {
  -- Mason for managing LSP servers, linters, formatters
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'pyright', -- Python LSP
        'ruff-lsp', -- Fast Python linter
        'black', -- Python formatter
        'isort', -- Import sorter
        'debugpy', -- Python debugger
      },
    },
  },

  -- LSP configuration
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = 'basic',
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        ruff_lsp = {
          init_options = {
            settings = {
              args = {},
            },
          },
        },
      },
    },
  },

  -- Python debugging
  {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    config = function()
      require('dap-python').setup 'python'
    end,
  },

  -- Code formatting
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        python = { 'isort', 'black' },
      },
    },
  },
}
