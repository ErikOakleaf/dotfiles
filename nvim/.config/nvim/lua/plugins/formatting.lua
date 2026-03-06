return {
	{
		"stevearc/conform.nvim",
		cmd = { "ConformInfo" },
		opts = {
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
		},

		keys = {
			{
				"<leader>gf",
				function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end,
				desc = "Format file",
			},
		},
	},
}
