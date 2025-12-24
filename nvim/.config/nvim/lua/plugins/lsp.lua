return {
    {
        "williamboman/mason.nvim",
        opts = {},
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = { "lua_ls" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("lsp").setup()
        end,
    },
}
