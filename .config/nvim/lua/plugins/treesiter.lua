return {
    "nvim-treesitter/nvim-treesitter", 
    branch = 'master',
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local treesitter_configs = require("nvim-treesitter.configs")
            treesitter_configs.setup {
                auto_install = true;
                highlight = { enable = true} ,
                indent = { enable = true },
        }
     end,
}
