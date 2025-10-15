return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    -- lsps
                    "clangd",
                    "zls",
                    "ts_ls",
                    "html",
                    "cssls",
                    "pyright",
                    "lua_ls",
                },
            })
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "williamboman/mason.nvim",
            "nvimtools/none-ls.nvim",
        },
        config = function()
            require("mason-null-ls").setup({
                ensure_installed = {
                    -- formatting / linting
                    "prettier",
                    "eslint_d",
                    "black",
                    "ruff",
                    "stylua",
                },
            })
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = {
                    "codelldb", -- C/C++/Rust
                },
                automatic_setup = true,
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            vim.lsp.config.clangd = { capabilities = capabilities }
            vim.lsp.enable('clangd')

            vim.lsp.config.zls = { capabilities = capabilities }
            vim.lsp.enable('zls')

            vim.lsp.config.ts_ls = { capabilities = capabilities }
            vim.lsp.enable('ts_ls')

            vim.lsp.config.html = { capabilities = capabilities }
            vim.lsp.enable('html')

            vim.lsp.config.cssls = { capabilities = capabilities }
            vim.lsp.enable('cssls')

            vim.lsp.config.pyright = { capabilities = capabilities }
            vim.lsp.enable('pyright')

            vim.lsp.config.lua_ls = { capabilities = capabilities }
            vim.lsp.enable('lua_ls')

            -- keymaps
            vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
        end,
    },
}
