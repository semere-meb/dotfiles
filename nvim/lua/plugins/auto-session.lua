return {
	'rmagatti/auto-session',
	lazy = false,
	config = function()
		require("auto-session").setup({
			bypass_save_filetypes = { 'alpha', 'dashboard' },
			suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
		})
	end
}
