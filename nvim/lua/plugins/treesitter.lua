return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = function()
			local lsp = require("lsp")
			return {
				ensure_installed = lsp.get_treesitter_parsers(),
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
			}
		end,
	},
}
