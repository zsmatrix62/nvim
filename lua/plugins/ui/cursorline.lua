return {
	require = function(use)
		use({
			"yamatsum/nvim-cursorline",
			event = "BufRead",
			config = function()
				require("nvim-cursorline").setup({
					cursorline = {
						enable = true,
						timeout = 1000,
						number = false,
					},
					cursorword = {
						enable = true,
						min_length = 3,
						hl = {
							underline = true,
						},
					},
				})
			end,
		})
	end,
}
