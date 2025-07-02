return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {"clangd",
                                    "zls",
                                    "ts_ls",
                                    "html",
                                    "cssls",
                                    "pyright",
                                    "lua_ls"
                }
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup({})
            lspconfig.zls.setup({})
            lspconfig.ts_ls.setup({})
            lspconfig.html.setup({})
            lspconfig.cssls.setup({})
            lspconfig.pyright.setup({})
            lspconfig.lua_ls.setup({})
        end

    }

}
