local ms = {
	require("plugins.tools.markdown"),
	require("plugins.tools.wakatime"),
	require("plugins.tools.fterm"),
}

return require("utils.pluginConfig").NewConfig({
	require = function(use)
		require("utils.pluginConfig").RequireModules(ms, use)
	end,
	setup = function()
		require("utils.pluginConfig").SetupModules(ms)
	end,
})
