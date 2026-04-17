local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
		lua = { "stylua" },
		python = { "black" },
		cs = { "csharpier" },
	},
})

vim.keymap.set("n", "<leader>gf", function()
	conform.format({ async = true, lsp_format = "fallback" })
end, { desc = "Format file" })
