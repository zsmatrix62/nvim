return {
	require = function(use)
		use({
			"xiyaowong/nvim-transparent",
			config = function()
				require("transparent").setup({
					enable = true,
					extra_groups = {
						"all",
						"NvimTreeNormal",
						"NvimTreeStatuslineNc",
						"NeoTreeFloatNormal",
						"NeoTreeFloatNormal",
						"NeoTreeNormal",
						"NeoTreeNormalNC",
						"FidgetTask",
						"FidgetTitle",
					},
					exclude = {},
				})
			end,
		})
	end,
}
