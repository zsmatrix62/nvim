local ms = {
	require("plugins.languages.go"),
	-- require "plugins.languages.swfit",
	require("plugins.languages.rust"),
}

return require("utils.pluginConfig").NewConfig({
	require = function(packerUse)
		require("utils.pluginConfig").RequireModules(ms, packerUse)
	end,
	setup = function()
		require("utils.pluginConfig").SetupModules(ms)
	end,
})
