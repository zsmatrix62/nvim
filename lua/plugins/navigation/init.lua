local ms = {
	-- require("plugins.navigation.easymotion"),
	require("plugins.navigation.hop"),
	require("plugins.navigation.telescope2"),
	-- require("plugins.navigation.neotree"),
	require("plugins.navigation.nvim-tree"),
}

return require("utils.pluginConfig").NewConfig({
	require = function(use)
		require("utils.pluginConfig").RequireModules(ms, use)
	end,
	setup = function()
		require("utils.pluginConfig").SetupModules(ms)
	end,
})
