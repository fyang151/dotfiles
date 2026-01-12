return {
	{
		"stevearc/oil.nvim",
		lazy = false,
		opts = {
			win_options = {
				signcolumn = "yes:2",
			},
		},
		dependencies = {
			{ "nvim-mini/mini.icons", opts = {} },
		},
	},

	{
		"refractalize/oil-git-status.nvim",

		dependencies = {
			"stevearc/oil.nvim",
		},

		config = true,
	},
}
