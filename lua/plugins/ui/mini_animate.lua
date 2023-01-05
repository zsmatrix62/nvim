return {
	require = function(use)
		use({
			"echasnovski/mini.nvim",
			config = function()
				require("mini.animate").setup()
			end,
		})
	end,
}
