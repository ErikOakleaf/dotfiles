return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            float = {
                transparent = true,
            },

            custom_highlights = function(colors)
                return {
                    LineNr = { fg = colors.text },
                    LineNrRelative = { fg = colors.text },
                }
            end
        })
        vim.cmd.colorscheme("catppuccin")
    end,

}
