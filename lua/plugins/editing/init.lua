local ms = {
	require("plugins.editing.workspace"),
	require("plugins.editing.formatters"),
	require("plugins.editing.treesitter"),
	require("plugins.editing.neogen"),
	require("plugins.editing.surround"),
	require("plugins.editing.history"),
	require("plugins.editing.outline"),
	require("plugins.editing.autopair"),
	require("plugins.editing.colorizer"),
	require("plugins.editing.comment"),
}

return require("utils.pluginConfig").NewConfig({
	require = function(use)
		use({
			"ThePrimeagen/refactoring.nvim",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-treesitter/nvim-treesitter" },
			},
			config = function()
				require("refactoring").setup({})
				-- load refactoring Telescope extension
				require("telescope").load_extension("refactoring")
				-- remap to open the Telescope refactoring menu in visual mode
				-- vim.api.nvim_set_keymap(
				-- 	"v",
				-- 	"<leader>rr",
				-- 	"<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
				-- 	{ noremap = true }
				-- )
			end,
		})
		use({ "mg979/vim-visual-multi", branch = "master" })
		use({
			"mrshmllow/document-color.nvim",
			config = function()
				require("document-color").setup({
					-- Default options
					mode = "background", -- "background" | "foreground" | "single"
				})
			end,
		})
		use("uga-rosa/ccc.nvim")
		require("utils.pluginConfig").RequireModules(ms, use)
	end,
	setup = function()
		require("utils.pluginConfig").SetupModules(ms)
	end,
})
