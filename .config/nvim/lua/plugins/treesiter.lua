return {
    "nvim-treesitter/nvim-treesitter", 
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter_configs = require("nvim-treesitter.configs")
            treesitter_configs.setup {
                ensure_installed = { "c", "zig", "javascript", "html", "css", "python", "lua"},
                highlight = { enable = true} ,
                indent = { enable = true },
        }
     end,
}
