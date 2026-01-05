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
}

M.formatters = {
  "stylua",
  "clang-format",
}

return M
