return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			ensure_installed = { "lua" },
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		},
	},
}
