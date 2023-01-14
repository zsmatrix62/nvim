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
					blend = 10,
				})
				vim.keymap.set("n", "<C-i>", '<cmd>lua require("FTerm").toggle()<cr>')
				vim.keymap.set("t", "<C-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
			end,
		})
	end,
}
