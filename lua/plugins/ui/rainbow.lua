return require 'utils.pluginConfig'.NewConfig({
	require = function(use)
		use { "luochen1990/rainbow",
			config = function()
				vim.g.rainbow_active = 1
			end
		}
	end,
})
