vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Flutter
vim.keymap.set("n", "<leader>fr", "<cmd>FlutterRun<cr>", { desc = "[R]un flutter" })
vim.keymap.set("n", "<leader>fR", "<cmd>FlutterRestart<cr>", { desc = "Hot [R]estart" })
vim.keymap.set("n", "<leader>fl", "<cmd>FlutterReload<cr>", { desc = "Hot re[L]oad" })
vim.keymap.set("n", "<leader>fd", "<cmd>FlutterDevices<cr>", { desc = "Open flutter [D]evices" })


