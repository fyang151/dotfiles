-- no im not joking. this is how i do it. stop hissing.
vim.keymap.set({ "n", "v" }, "J", "4j", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "K", "4k", { noremap = true, silent = true })

vim.keymap.set("n", "gJ", "J", { noremap = true, silent = true })
vim.keymap.set("n", "gK", "K", { noremap = true, silent = true })

vim.keymap.set("n", "<space>f", function() require('conform').format() end)
