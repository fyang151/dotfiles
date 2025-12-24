local M = {}

function M.setup()
    local on_attach = function(_, bufnr)
        local map = vim.keymap.set
        map("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
        map("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
        map("n", "gr", vim.lsp.buf.references, { buffer = bufnr })
    end

    vim.lsp.config.lua_ls = {
        on_attach = on_attach,
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    }

    vim.lsp.enable("lua_ls")
end

return M
