return {
	"windwp/nvim-autopairs",
	event = "BufRead",
	config = function()
		require("nvim-autopairs").setup({
			disable_filetype = { "TelescopePrompt", "vim" },
		})
	end,
}
