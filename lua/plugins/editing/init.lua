local ms = {
	require("plugins.editing.treesitter"),
	require("plugins.editing.neogen"),
	require("plugins.editing.autopair"),
	require("plugins.editing.surround"),
	require("plugins.editing.colorizer"),
	require("plugins.editing.comment"),
	require("plugins.editing.ts-auto-tag"),
	require("plugins.editing.context"),
}

return require("utils.pluginConfig").NewConfig({
	require = function(use)
		use({ "mg979/vim-visual-multi", branch = "master" })
		require("utils.pluginConfig").RequireModules(ms, use)
	end,
	setup = function()
		require("utils.pluginConfig").SetupModules(ms)
	end,
})
