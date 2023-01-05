return {
	require = function(use)
		use({
			"numToStr/FTerm.nvim",
			config = function()
				require("FTerm").setup({
					border = "double",
					dimensions = {
						height = 0.9,
						width = 0.9,
					},
				})
				vim.keymap.set("n", "<c-i>", '<cmd>lua require("FTerm").toggle()<cr>')
				vim.keymap.set("t", "<c-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
			end,
		})
	end,
}
