return {
	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ibhagwan/fzf-lua",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup({
				use_local_fs = false,
				enable_builtin = true,
				default_remote = { "upstream", "origin" },
				picker = "fzf-lua",
			})
		end,
	},
}
