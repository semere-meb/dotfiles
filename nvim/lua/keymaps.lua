vim.g.mapleader = " "

-- buffer
vim.keymap.set("n", "<leader>n", ":bn<CR>")
vim.keymap.set("n", "<leader>p", ":bp<CR>")
vim.keymap.set("n", "<leader>x", ":bd<CR>")

-- copy to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
