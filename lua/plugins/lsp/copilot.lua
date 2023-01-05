local INSTALL_COPILOT_OFFICAL =
	[[:silent !rm -rf ~/.config/nvim/pack/github/start/copilot.vim && git clone https://github.com/github/copilot.vim.git ~/.config/nvim/pack/github/start/copilot.vim ]]

return {
	require = function(use)
		-- use {
		-- 	"zbirenbaum/copilot.lua",
		-- 	-- Install official plugins
		-- 	run = function()
		-- 		vim.api.nvim_command(INSTALL_COPILOT_OFFICAL)
		-- 	end,
		-- 	config = function()
		-- 		require("copilot").setup()
		-- 	end,
		-- }
		-- use { "zbirenbaum/copilot-cmp",
		-- 	after = { "copilot.lua", "nvim-cmp" },
		-- }
	end,
}
