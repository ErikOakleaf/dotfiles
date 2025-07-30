return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio"
    },
    config = function()
        local dap, dapui = require("dap"), require("dapui")
        dapui.setup();
        local codellb_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/bin/codelldb")

        dap.adapters.codelldb = {
            type = "executable",
            command = codellb_path,
        }

        dap.configurations.c = {
              {
            name = "Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
                  return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
            cwd = '${workspaceFolder}',
            stopOnEntry = false,
          },
        }

        dap.configurations.cpp = dap.configurations.c;

        dap.listeners.before.attach.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.launch.dapui_config = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated.dapui_config = function()
            dapui.close()
        end
        dap.listeners.before.event_exited.dapui_config = function()
            dapui.close()
        end

        -- styling
        vim.fn.sign_define('DapBreakpoint', {
            text = 'B',
            texthl = 'DapBreakpoint',
            linehl = '',
            numhl = ''
        })
        vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = '#ffffff' })  -- White

        -- keymaps
        vim.keymap.set('n', '<Leader>dt', function() dapui.toggle() end)
        vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end)
        vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
        vim.keymap.set('n', '<Leader>dC', function() dap.run_last() end)
        vim.keymap.set('n', '<Leader>ds', function() dap.terminate() end)
        vim.keymap.set('n', '<leader>do', function() dap.step_over() end)
        vim.keymap.set('n', '<leader>dO', function() dap.step_out() end)
        vim.keymap.set('n', '<Leader>di', function() dap.step_into() end)
    end,
}
