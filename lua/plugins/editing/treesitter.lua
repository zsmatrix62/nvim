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
						"markdown_inline",
						"html",
					},
					sync_install = false,
					ignore_install = {},
					highlight = {
						enable = true,
						ft_blocklist = {},
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
