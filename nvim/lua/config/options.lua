-- color
vim.opt.termguicolors = true

-- tab
vim.opt.tabstop = 2
vim.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- ui
vim.opt.number = true
vim.opt.showmode = false

-- wrapping stuff
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.linebreak = true

vim.opt.clipboard = "unnamedplus"
vim.opt.fillchars = { eob = " " }

-- sync with system clipboard on focus gain and lost
-- this resolves slow startup times on WSL2
-- vim.api.nvim_create_autocmd({ "FocusGained" }, {
-- 	pattern = { "*" },
-- 	command = [[call setreg("@", getreg("+"))]],
-- })
-- vim.api.nvim_create_autocmd({ "FocusGained" }, {
-- 	pattern = { "*" },
-- 	command = [[call setreg("@", getreg("+"))]],
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- evil autosave
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged", "FocusLost", "BufLeave" }, {
	pattern = "*",
	callback = function()
		if vim.bo.modified and vim.bo.buftype == "" then
			vim.cmd("silent noautocmd write")
		end
	end,
})

-- try to use glance for grr
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local buf = args.buf
		local opts = { buffer = buf, silent = true }

		vim.keymap.set("n", "grr", "<cmd>Glance references<CR>", opts)
	end,
})

-- word count and stuff for notes
vim.api.nvim_create_user_command("CharWordCount", function(opts)
	local start_line, end_line

	if opts.range == 0 then
		start_line = 0
		end_line = -1
	else
		start_line = opts.line1 - 1
		end_line = opts.line2
	end

	local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, true)
	local text = table.concat(lines, "\n")

	local words = 0
	for _ in text:gmatch("%S+") do
		words = words + 1
	end

	local chars = vim.fn.strchars(text)

	print(string.format("%d words · %d chars", words, chars))
end, {
	range = true,
})
