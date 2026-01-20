return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },

				c = { "clang-format" },
				cpp = { "clang-format" },

				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },

				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },

				kdl = { "kdlfmt" },

				-- python = { "isort", "black" },
			},
			format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
		},
	},
}
