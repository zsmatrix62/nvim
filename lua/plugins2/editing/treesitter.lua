return {
	"nvim-treesitter/nvim-treesitter",
	-- build = ":TSUpdate",
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
			auto_install = true,
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
}
