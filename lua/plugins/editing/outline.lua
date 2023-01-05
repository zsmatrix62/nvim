return {
	require = function(use)
		use 'simrat39/symbols-outline.nvim'
		require("symbols-outline").setup()

		vim.api.nvim_set_keymap("", "<space>t", ":SymbolsOutline<cr>", { silent = true })
	end
}
