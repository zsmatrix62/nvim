return {
	require = function(use)
		use({
			"TimUntersberger/neogit",
			config = function()
				local neogit = require("neogit")
				neogit.setup({})
				vim.api.nvim_set_keymap("n", "<leader>gi", ":lua require('neogit').open()<cr>", {})
			end,
		})
	end,
}
