local lsp = require("lsp")

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      for server, config in pairs(lsp.servers) do
        vim.lsp.config(server, {
          on_attach = lsp.on_attach,
          settings = config.settings,
          cmd = config.cmd,
        })

        vim.lsp.enable(server)
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(lsp.servers),
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    event = "VeryLazy",
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = lsp.formatters,
      })
    end,
  },
}
