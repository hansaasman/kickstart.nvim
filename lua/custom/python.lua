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
    -- Remove ft = 'python' to ensure it loads immediately
    dependencies = {
      'mfussenegger/nvim-dap',
      'rcarriga/nvim-dap-ui',
    },
    config = function()
      local path = vim.fn.expand('~/.local/share/nvim/mason/packages/debugpy/venv/bin/python')
      require('dap-python').setup(path)
      
      -- Ensure debugpy adapter is registered
      local dap = require('dap')
      if not dap.adapters.python then
        dap.adapters.python = {
          type = 'executable',
          command = path,
          args = { '-m', 'debugpy.adapter' },
        }
      end
      
      -- Alias debugpy to python adapter for compatibility
      dap.adapters.debugpy = dap.adapters.python
      
      -- FastAPI debug configurations
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
          -- Check the specific project path first
          local project_venv = '/disk1/hans/sib/contract-sib/hans/api/.venv/bin/python'
          if vim.fn.executable(project_venv) == 1 then
            return project_venv
          end
          
          -- Then check for Poetry environment
          local handle = io.popen('cd /disk1/hans/sib/contract-sib/hans/api && poetry env info --path 2>/dev/null')
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
          -- Fallback to venv in current directory
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
          -- Check the specific project path first
          local project_venv = '/disk1/hans/sib/contract-sib/hans/api/.venv/bin/python'
          if vim.fn.executable(project_venv) == 1 then
            return project_venv
          end
          
          -- Then check for Poetry environment
          local handle = io.popen('cd /disk1/hans/sib/contract-sib/hans/api && poetry env info --path 2>/dev/null')
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
          -- Fallback to venv in current directory
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
