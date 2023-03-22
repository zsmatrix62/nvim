return {
	"xiyaowong/nvim-transparent",
	event = "BufEnter",
	config = function()
		require("transparent").setup({
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
		})
		vim.api.nvim_exec(":TransparentEnable", false)
	end,
}
