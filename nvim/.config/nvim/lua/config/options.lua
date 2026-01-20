vim.opt.swapfile = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

-- Add wrapping and move by visual lines instead of physical lines
vim.keymap.set("n", "j", "gj", { silent = true })
vim.keymap.set("n", "k", "gk", { silent = true })
vim.opt.wrap = true
vim.opt.linebreak = true

-- Add spellchecking for markdown files
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown", "gitcommit" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
	end,
})

-- keymaps

vim.g.mapleader = " "

vim.api.nvim_set_keymap("i", "<C-v>", "<C-r>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-z>", "<C-o>u", { noremap = true, silent = true })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-o>", "<C-r>", { noremap = true, silent = true })
vim.keymap.set("n", "gb", "<C-o>", { noremap = true, silent = true })
