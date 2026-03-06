return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        opts = {
            ensure_installed = { "codelldb" }, -- C/C++/Rust
            automatic_setup = true,
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            {
                "mason-org/mason-lspconfig.nvim",
                opts = {
                    ensure_installed = {
                        "clangd",
                        "zls",
                        "ts_ls",
                        "html",
                        "cssls",
                        "pyright",
                        "lua_ls",
                        "omnisharp",
                    },
                },
            },
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local servers = {
                "clangd",
                "zls",
                "ts_ls",
                "html",
                "cssls",
                "pyright",
                "lua_ls",
                "omnisharp",
            }

            for _, server in ipairs(servers) do
                vim.lsp.config(server, {
                    capabilities = capabilities,
                })

                vim.lsp.enable(server)
            end

            -- keymaps
            vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
        end,
    },
}
