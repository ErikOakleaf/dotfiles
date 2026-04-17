-- Build hooks: run shell commands after install/update for plugins that require compilation
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		if ev.data.spec.name == "LuaSnip" and (ev.data.kind == "install" or ev.data.kind == "update") then
			vim.system({ "make", "install_jsregexp" }, { cwd = ev.data.path })
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/catppuccin/nvim" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/ThePrimeagen/harpoon", version = "harpoon2" },
	{ src = "https://github.com/nvim-tree/nvim-web-devicons" },
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },

	-- completions and snippets
	{ src = "https://github.com/L3MON4D3/LuaSnip", name = "LuaSnip" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
	{ src = "https://github.com/hrsh7th/cmp-buffer" },
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },

	-- formatting
	{ src = "https://github.com/stevearc/conform.nvim" },

	-- lsp config
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
})

require("plugins.telescope")
require("plugins.catppuccin")
require("plugins.autopairs")
require("plugins.harpoon")
require("plugins.lualine")
require("plugins.treesitter")
require("plugins.cmp")
require("plugins.conform")
require("plugins.lspconfig")
require("plugins.mason")
