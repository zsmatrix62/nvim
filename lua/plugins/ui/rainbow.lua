return require("utils.pluginConfig").NewConfig({
	require = function(use)
		use({
			"luochen1990/rainbow",
			event = "BufRead",
			config = function()
				vim.g.rainbow_active = 1
			end,
		})
	end,
})
