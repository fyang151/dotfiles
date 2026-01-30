return {
	{
		"stevearc/conform.nvim",
		opts = function()
			local lsp = require("lsp")
			return {
				formatters_by_ft = lsp.get_formatters_by_ft(),
				format_on_save = { timeout_ms = 500, lsp_format = "fallback" },
			}
		end,
	},
}
