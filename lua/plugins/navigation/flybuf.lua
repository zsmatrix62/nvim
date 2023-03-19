return {
	require = function(use)
		use({
			"zsmatrix62/flybuf.nvim",
			config = function()
				require("flybuf").setup({})
				local keymap = vim.api.nvim_set_keymap
				keymap("n", "gn", ":FlyBuf<cr>", {})
			end,
		})
	end,
}
