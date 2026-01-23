-- i dont have any reason to allow recursion so im gonna do this
local opts = { noremap = true }

-- motions
-- no im not joking. this is how i do it. stop hissing.
vim.keymap.set({ "n", "v" }, "J", "4j", opts)
vim.keymap.set({ "n", "v" }, "K", "4k", opts)

vim.keymap.set("n", "gJ", "J", opts)
vim.keymap.set("n", "gK", "K", opts)

-- format
vim.keymap.set("n", "<space>f", function()
	require("conform").format()
end, opts)

-- Oil
vim.keymap.set("n", "<space>o", "<cmd>Oil<CR>", opts)

-- LSP stuff
-- open diagnostic float
vim.keymap.set("n", "gh", vim.diagnostic.open_float, opts)

-- mimic normie deletion for linux
vim.keymap.set("i", "<C-BS>", "<C-w>")
-- for windows
vim.keymap.set("i", "<C-h>", "<C-w>")
