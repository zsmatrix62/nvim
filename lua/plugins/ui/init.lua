local modules = {
	require("plugins.ui.feline"),
	require("plugins.ui.fidget"),
	require("plugins.ui.rainbow"),
	require("plugins.ui.todo_comments"),
	require("plugins.ui.indent_line"),
	require("plugins.ui.cursorline"),
	require("plugins.ui.smoothcursor"),
	require("plugins.ui.windowpicker"),
	require("plugins.ui.transparent"),
}

return require("utils.pluginConfig").NewConfig({
	require = function(use)
		use("mhinz/vim-startify")
		use("nvim-tree/nvim-web-devicons")

		require("utils.pluginConfig").RequireModules(modules, use)
	end,
	setup = function()
		require("utils.pluginConfig").SetupModules(modules)
	end,
})
