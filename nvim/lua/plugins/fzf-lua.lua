return {
	{
		"ibhagwan/fzf-lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		---@module "fzf-lua"
		---@type fzf-lua.Config|{}
		---@diagnostic disable: missing-fields
		opts = {},
		---@diagnostic enable: missing-fields
		keys = {
			-- Fuzzy find files
			{ "<space>p", "<cmd>FzfLua files<cr>", desc = "Find files" },
		},
	},
}
