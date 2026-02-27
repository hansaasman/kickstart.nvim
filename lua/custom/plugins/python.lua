-- Python LSP and tools setup
return {
  -- LSP configuration — opts are merged into init.lua's lspconfig config
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        pyright = {
          on_init = function(client)
            -- Search for .venv in project tree (handles nested Poetry projects)
            local root = client.config.root_dir or vim.fn.getcwd()
            local venvs = vim.fs.find('.venv', {
              path = root,
              upward = false,
              type = 'directory',
              limit = 1,
            })
            if #venvs > 0 then
              local python = venvs[1] .. '/bin/python'
              if vim.fn.executable(python) == 1 then
                client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                  python = { pythonPath = python },
                })
                client.notify('workspace/didChangeConfiguration', { settings = nil })
              end
            end
          end,
          settings = {
            pyright = { disableOrganizeImports = true }, -- Ruff handles imports
            python = {
              analysis = {
                typeCheckingMode = 'basic',
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        ruff = {}, -- Native Ruff server (replaces deprecated ruff-lsp)
      },
      tools = { 'debugpy', 'black' },
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
      local path = vim.fn.expand '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
      require('dap-python').setup(path)

      -- Ensure debugpy adapter is registered
      local dap = require 'dap'
      if not dap.adapters.python then
        dap.adapters.python = {
          type = 'executable',
          command = path,
          args = { '-m', 'debugpy.adapter' },
        }
      end

      -- Alias debugpy to python adapter for compatibility
      dap.adapters.debugpy = dap.adapters.python

      -- Function to resolve python path
      local function get_python_path()
        -- Check for Poetry environment in current directory
        local handle = io.popen 'poetry env info --path 2>/dev/null'
        if handle then
          local result = handle:read '*a'
          handle:close()
          if result and result ~= '' then
            local poetry_path = vim.trim(result) .. '/bin/python'
            if vim.fn.executable(poetry_path) == 1 then
              return poetry_path
            end
          end
        end

        -- Check for venv in current directory
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
          return cwd .. '/venv/bin/python'
        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
          return cwd .. '/.venv/bin/python'
        else
          return '/usr/bin/python3.11'
        end
      end

      -- Override launch.json configurations to fix VS Code specific variables
      local original_load_launchjs = require('dap.ext.vscode').load_launchjs
      require('dap.ext.vscode').load_launchjs = function(path, type_to_filetypes)
        -- Load the original configuration
        original_load_launchjs(path, type_to_filetypes)

        -- Fix Python configurations
        if dap.configurations.python then
          for _, config in ipairs(dap.configurations.python) do
            -- Replace VS Code specific variables
            if config.pythonPath == '${command:python.interpreterPath}' then
              config.pythonPath = get_python_path
            end
            if config.program == '${file}' then
              config.program = vim.fn.expand '%:p'
            end
            if config.cwd == '${workspaceFolder}' then
              config.cwd = vim.fn.getcwd()
            end
          end
        end
      end

      -- Override any VS Code specific configurations
      dap.configurations.python = dap.configurations.python or {}

      -- Basic Python file debugging (default)
      table.insert(dap.configurations.python, 1, {
        type = 'python',
        request = 'launch',
        name = 'Launch file',
        program = function()
          return vim.fn.expand '%:p'
        end,
        pythonPath = get_python_path,
        cwd = vim.fn.getcwd,
        console = 'integratedTerminal',
        justMyCode = false,
      })

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
          '--host',
          '0.0.0.0',
          '--port',
          '8001',
        },
        env = {
          DEBUG_MODE = 'true',
          PYTHONPATH = vim.fn.getcwd(),
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
          local handle = io.popen 'cd /disk1/hans/sib/contract-sib/hans/api && poetry env info --path 2>/dev/null'
          if handle then
            local result = handle:read '*a'
            handle:close()
            if result and result ~= '' then
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
          '--host',
          '0.0.0.0',
          '--port',
          '8000',
        },
        env = {
          DEBUG_MODE = 'true',
          PYTHONPATH = vim.fn.getcwd(),
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
          local handle = io.popen 'cd /disk1/hans/sib/contract-sib/hans/api && poetry env info --path 2>/dev/null'
          if handle then
            local result = handle:read '*a'
            handle:close()
            if result and result ~= '' then
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
        python = { 'ruff_fix', 'black' },
      },
    },
  },
}
