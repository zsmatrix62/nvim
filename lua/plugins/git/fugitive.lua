return {
	require = function(use)
		use({
			"tpope/vim-fugitive",
			event = "BufRead",
			config = function()
				vim.api.nvim_set_keymap("n", "<leader>ga", ":Git add %<cr>", {})
			end,
		})
	end,
}
