-- TAB
vim.opt.tabstop = 4
vim.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- UI
vim.opt.number = true
vim.opt.showmode = false

vim.opt.breakindent = true

vim.opt.clipboard = "unnamedplus"

-- sync with system clipboard on focus gain and lost
-- this resolves slow startup times on WSL2
-- vim.api.nvim_create_autocmd({ "FocusGained" }, {
--     pattern = { "*" },
--     command = [[call setreg("@", getreg("+"))]],
-- })
-- vim.api.nvim_create_autocmd({ "FocusGained" }, {
--     pattern = { "*" },
--     command = [[call setreg("@", getreg("+"))]],
-- })

vim.api.nvim_create_autocmd('TextYankPost', {
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

