return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				width = function()
					return math.floor(vim.o.columns * 0.18)
				end,
			},
		})
		vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
		vim.keymap.set("n", "<leader>b", ":Neotree source=buffers toggle<CR>", { desc = "Toggle Buffers" })
		vim.keymap.set("n", "<leader>g", ":Neotree source=git_status toggle<CR>", { desc = "Toggle Git Status" })
	end,
}
