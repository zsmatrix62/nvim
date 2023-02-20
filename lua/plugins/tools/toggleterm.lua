return {
	require = function(use)
		use({
			"akinsho/toggleterm.nvim",
			config = function()
				require("toggleterm").setup({
					open_mapping = [[<c-\>]],
				})
			end,
		})
	end,
}
