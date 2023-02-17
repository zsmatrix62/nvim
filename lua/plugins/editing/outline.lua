return {
	-- require = function(use)
	-- 	use 'simrat39/symbols-outline.nvim'
	-- 	require("symbols-outline").setup()
	--
	-- 	vim.api.nvim_set_keymap("", "<space>t", ":SymbolsOutline<cr>", { silent = true })
	-- end
	require = function(use)
		use({
			"stevearc/aerial.nvim",
			config = function()
				require("aerial").setup({
					layout = {
						min_width = 30,
					},
					close_automatic_events = {
						"switch_buffer",
						"unfocus",
					},
					keymaps = {},
				})
				vim.api.nvim_set_keymap("", "<space>t", ":AerialToggle right<cr>", { silent = true })
			end,
		})
	end,
	-- vim.api.nvim_set_keymap("", "<space>t", ":Lspsaga outline<cr>", { silent = true }),
}
