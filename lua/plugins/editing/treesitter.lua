return {
	require = function(use)
		use({
			"nvim-treesitter/nvim-treesitter",
			-- run = ":TSUpdate",
			config = function()
				require("nvim-treesitter.configs").setup({
					ensure_installed = {
						"lua",
						"rust",
						"go",
						"tsx",
						"css",
						"scss",
						"html",
						"javascript",
						"typescript",
						"python",
						"json",
						"json5",
						"make",
						"cpp",
						"gitignore",
						"gomod",
						"markdown",
					},
					sync_install = false,
					ignore_install = {
						"html",
					},
					highlight = {
						enable = true,
						disable = {},
						additional_vim_regex_highlighting = { "markdown" },
					},
					keymaps = {
						goto_definition = "gD",
					},
					autotag = { enable = true },
				})
			end,
		})
	end,
}
