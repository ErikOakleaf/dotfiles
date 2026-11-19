require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		-- LSPs
		"clangd",
		"zls",
		"ts_ls",
		"html",
		"cssls",
		"pyright",
		"lua_ls",
		"roslyn-language-server",
		-- Formatters
		"prettier",
		"black",
		"stylua",
		"csharpier",
		-- Linters
		"eslint_d",
		"ruff",
		-- Debuggers
		-- "codelldb",
	},
})
