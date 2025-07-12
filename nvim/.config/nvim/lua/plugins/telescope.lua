return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = { "zig%-out/", "zig%-out/.*" },
            },
        })

        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<C-r>', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<C-e>', builtin.diagnostics, {})
    end
}
