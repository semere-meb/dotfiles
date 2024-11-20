return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"clangd", 
					-- "black",
					-- "isort",
					-- "clang-format",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			local on_attach = function(_, bufnr)
				local function buf_set_keymap(...)
					vim.api.nvim_buf_set_keymap(bufnr, ...)
				end

				buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
				buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
				buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
				buf_set_keymap("n", "gr", "<Cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
				buf_set_keymap(
					"n",
					"gi",
					"<Cmd>lua vim.lsp.buf.implementation()<CR>",
					{ noremap = true, silent = true }
				)
				buf_set_keymap(
					"n",
					"gs",
					"<Cmd>lua vim.lsp.buf.signature_help()<CR>",
					{ noremap = true, silent = true }
				)
				buf_set_keymap(
					"n",
					"<leader>rn",
					"<Cmd>lua vim.lsp.buf.rename()<CR>",
					{ noremap = true, silent = true }
				)
			end

			lspconfig.lua_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				fileteypes = { "python" },
			})
			lspconfig.clangd.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})
		end,
	},
}
