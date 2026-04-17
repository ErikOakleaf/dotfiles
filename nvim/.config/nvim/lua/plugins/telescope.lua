local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup({
	defaults = {
		file_ignore_patterns = { "zig%-out/" },
	},
})

vim.keymap.set("n", "<C-r>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<C-e>", builtin.diagnostics, {})
