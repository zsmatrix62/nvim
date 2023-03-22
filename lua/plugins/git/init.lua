local ms = {
	-- require("plugins.git.fugitive"),
	-- require("plugins.git.gitsigns"),
}
return require("utils.pluginConfig").NewConfig({
	require = function(use)
		-- use({
		-- 	"junegunn/gv.vim",
		-- 	requires = "tpope/vim-fugitive",
		-- 	event = "BufRead",
		-- })
		require("utils.pluginConfig").RequireModules(ms, use)
	end,
	setup = function()
		require("utils.pluginConfig").SetupModules(ms)
	end,
})
