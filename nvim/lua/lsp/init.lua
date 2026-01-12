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
}

M.formatters = {
  "stylua",
  "clang-format",
  "prettierd",
}

return M
