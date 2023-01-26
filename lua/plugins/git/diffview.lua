return {
	require = function(use)
		use({ "sindrets/diffview.nvim", event = "BufRead", requires = "nvim-lua/plenary.nvim" })
	end,
}
