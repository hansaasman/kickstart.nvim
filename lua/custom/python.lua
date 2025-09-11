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
      local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
      require('dap-python').setup(path)
      
      -- FastAPI debug configurations
      local dap = require('dap')
      table.insert(dap.configurations.python, {
        type = 'python',
        request = 'launch',
        name = 'Python Debugger: FastAPI (Poetry)',
        module = 'uvicorn',
        cwd = '/disk1/hans/sib/contract-sib/hans/api',
        args = {
          'api.main:app',
          '--reload',
          '--ssl-certfile=/etc/ssl/certs/blade9.franz.com.crt',
          '--ssl-keyfile=/etc/ssl/certs/blade9.franz.com.key',
          '--host', '0.0.0.0',
          '--port', '8001'
        },
        env = {
          DEBUG_MODE = 'true',
          PYTHONPATH = vim.fn.getcwd()
        },
        console = 'integratedTerminal',
        justMyCode = false,
        pythonPath = function()
          -- First check for Poetry environment
          local handle = io.popen('poetry env info --path 2>/dev/null')
          if handle then
            local result = handle:read("*a")
            handle:close()
            if result and result ~= "" then
              local poetry_path = vim.trim(result) .. '/bin/python'
              if vim.fn.executable(poetry_path) == 1 then
                return poetry_path
              end
            end
          end
          -- Fallback to venv
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return '/usr/bin/python'
          end
        end,
      })
      
      -- FastAPI without SSL (for local dev)
      table.insert(dap.configurations.python, {
        type = 'python',
        request = 'launch',
        name = 'FastAPI (No SSL)',
        module = 'uvicorn',
        args = {
          'api.main:app',
          '--reload',
          '--host', '0.0.0.0',
          '--port', '8000'
        },
        env = {
          DEBUG_MODE = 'true',
          PYTHONPATH = vim.fn.getcwd()
        },
        console = 'integratedTerminal',
        justMyCode = false,
        pythonPath = function()
          -- First check for Poetry environment
          local handle = io.popen('poetry env info --path 2>/dev/null')
          if handle then
            local result = handle:read("*a")
            handle:close()
            if result and result ~= "" then
              local poetry_path = vim.trim(result) .. '/bin/python'
              if vim.fn.executable(poetry_path) == 1 then
                return poetry_path
              end
            end
          end
          -- Fallback to venv
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
            return cwd .. '/venv/bin/python'
          elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
            return cwd .. '/.venv/bin/python'
          else
            return '/usr/bin/python'
          end
        end,
      })
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
