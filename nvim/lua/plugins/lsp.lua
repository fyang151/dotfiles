return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = { "lua_ls", "clangd" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lsp").setup()
        end,
    },
}
