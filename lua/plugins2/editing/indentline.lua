return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufRead",
	config = function()
		require("indent_blankline").setup({})
	end,
}
