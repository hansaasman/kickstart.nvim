-- Go LSP, formatting, linting, testing, and tooling
return {
  -- LSP — gopls with productivity settings (merges into init.lua's lspconfig)
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                shadow = true,
                nilness = true,
                unusedwrite = true,
                useany = true,
              },
              staticcheck = true,
              gofumpt = true,
              completeUnimported = true,
              usePlaceholders = true,
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        },
      },
      tools = { 'gofumpt', 'goimports', 'gomodifytags', 'impl', 'golangci-lint', 'gotestsum' },
    },
  },

  -- Formatting — goimports + gofumpt via conform.nvim
  {
    'stevearc/conform.nvim',
    opts = {
      formatters_by_ft = {
        go = { 'goimports', 'gofumpt' },
      },
    },
  },

  -- Linting — golangci-lint via nvim-lint
  {
    'mfussenegger/nvim-lint',
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'go',
        once = true,
        callback = function()
          require('lint').linters_by_ft.go = { 'golangcilint' }
        end,
      })
    end,
  },

  -- Treesitter — Go grammars
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { 'go', 'gomod', 'gosum', 'gowork' })
    end,
  },

  -- Testing — neotest + neotest-golang
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'nvim-lua/plenary.nvim',
      'antoinemadec/FixCursorHold.nvim',
      'nvim-treesitter/nvim-treesitter',
      'fredrikaverpil/neotest-golang',
    },
    ft = 'go',
    keys = {
      { '<leader>tn', function() require('neotest').run.run() end, desc = '[T]est [N]earest' },
      { '<leader>tf', function() require('neotest').run.run(vim.fn.expand('%')) end, desc = '[T]est [F]ile' },
      { '<leader>ts', function() require('neotest').summary.toggle() end, desc = '[T]est [S]ummary' },
      { '<leader>to', function() require('neotest').output.open({ enter = true }) end, desc = '[T]est [O]utput' },
      { '<leader>tp', function() require('neotest').output_panel.toggle() end, desc = '[T]est [P]anel' },
      { '<leader>td', function() require('neotest').run.run({ strategy = 'dap' }) end, desc = '[T]est [D]ebug nearest' },
    },
    config = function()
      require('neotest').setup {
        adapters = {
          require 'neotest-golang' {
            runner = 'gotestsum',
            go_test_args = { '-v', '-race', '-count=1' },
          },
        },
      }
    end,
  },

  -- Go tooling — struct tags, interface stubs, if err, test generation
  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
    },
    build = ':GoInstallDeps',
    opts = {},
  },

  -- Debug virtual text — shows variable values inline during debug sessions
  {
    'theHamsta/nvim-dap-virtual-text',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-treesitter/nvim-treesitter' },
    opts = {},
  },
}
