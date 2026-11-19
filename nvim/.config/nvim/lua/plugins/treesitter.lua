local treesitter = require("nvim-treesitter")

treesitter.install({
	"c",
	"c_sharp",
	"lua",
	"vim",
	"vimdoc",
	"markdown",
	"markdown_inline",
	"query",
	"rust",
	"javascript",
	"zig",
	"python",
	"html",
	"css",
	"zsh",
	"bash",
	"editorconfig",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"c",
		"cs",
		"lua",
		"vim",
		"help",
		"markdown",
		"query",
		"rust",
		"javascript",
		"zig",
		"python",
		"html",
		"css",
		"zsh",
		"sh",
		"editorconfig",
	},
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
