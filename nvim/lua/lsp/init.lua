local M = {}

M.servers = {
	lua_ls = {
		settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		},
	},
	clangd = {},
	tsgo = {},
	html = {},
	emmet_ls = {},
}

M.formatters = {
	"stylua",
	"clang-format",
	"prettierd",
	"kdlfmt",
}

return M
