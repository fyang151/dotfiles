local M = {}

M.languages = {
	lua = {
		lsp = "lua_ls",
		lsp_settings = {
			Lua = {
				diagnostics = { globals = { "vim" } },
			},
		},
		formatters = { "stylua" },
		treesitter = { "lua" },
	},

	c = {
		lsp = "clangd",
		formatters = { "clang-format" },
		treesitter = { "c" },
	},

	cpp = {
		lsp = "clangd",
		formatters = { "clang-format" },
		treesitter = { "cpp" },
	},

	typescript = {
		lsp = "tsgo",
		formatters = { "prettierd" },
		treesitter = { "typescript" },
	},

	typescriptreact = {
		lsp = "tsgo",
		formatters = { "prettierd" },
		treesitter = { "tsx" },
	},

	javascript = {
		lsp = "tsgo",
		formatters = { "prettierd" },
		treesitter = { "javascript" },
	},

	javascriptreact = {
		lsp = "tsgo",
		formatters = { "prettierd" },
		treesitter = { "tsx" },
	},

	html = {
		lsp = "html",
		treesitter = { "html", "css" },
	},

	css = {
		lsp = "emmet_ls",
		treesitter = { "css" },
	},

	kdl = {
		formatters = { "kdlfmt" },
		treesitter = { "kdl" },
	},

	swift = {
		lsp = "sourcekit",
		lsp_via_mason = false,
		formatters = { "swiftformat" },
		treesitter = { "swift" },
	},
}

M.extra_treesitter = {
	"json",
	"yaml",
	"toml",
	"bash",
	"markdown",
	"markdown_inline",
	"gitcommit",
	"gitignore",
	"git_config",
	"git_rebase",
	"vim",
	"vimdoc",
}

function M.get_lsp_servers()
	local servers = {}
	for _, lang in pairs(M.languages) do
		if lang.lsp then
			servers[lang.lsp] = {
				settings = lang.lsp_settings,
				cmd = lang.lsp_cmd,
				via_mason = lang.lsp_via_mason ~= false,
			}
		end
	end
	return servers
end

function M.get_mason_lsp_servers()
	local servers = {}
	for name, config in pairs(M.get_lsp_servers()) do
		if config.via_mason then
			servers[name] = config
		end
	end
	return servers
end

function M.get_formatters()
	local formatters = {}
	for _, lang in pairs(M.languages) do
		if lang.formatters then
			for _, formatter in ipairs(lang.formatters) do
				if not vim.tbl_contains(formatters, formatter) then
					table.insert(formatters, formatter)
				end
			end
		end
	end
	return formatters
end

function M.get_formatters_by_ft()
	local by_ft = {}
	for ft, lang in pairs(M.languages) do
		if lang.formatters then
			by_ft[ft] = lang.formatters
		end
	end
	return by_ft
end

function M.get_treesitter_parsers()
	local parsers = vim.deepcopy(M.extra_treesitter)
	for _, lang in pairs(M.languages) do
		if lang.treesitter then
			for _, parser in ipairs(lang.treesitter) do
				if not vim.tbl_contains(parsers, parser) then
					table.insert(parsers, parser)
				end
			end
		end
	end
	return parsers
end

return M
