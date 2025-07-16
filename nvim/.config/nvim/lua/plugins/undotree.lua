return {
    "mbbill/undotree",
    config = function()
        -- Make undotree focus the panel when toggled
        vim.g.undotree_SetFocusWhenToggle = 1

        -- keymaps
        vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)
    end
}
