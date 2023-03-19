return {
	require = function(use)
		use({
			"folke/neodev.nvim",
			config = function()
				require("neodev").setup()
			end,
		})
	end,
}
