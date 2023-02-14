return {
	require = function(use)
		use({
			"phaazon/hop.nvim",
			event = "BufRead",
			config = function()
				require("hop").setup({
					-- keys = 'asdfghjklweruiocvbnm',
					case_insensitive = true,
				})
				vim.api.nvim_set_keymap(
					"",
					"f",
					"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
					{}
				)
				vim.api.nvim_set_keymap(
					"",
					"F",
					"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
					{}
				)
				vim.api.nvim_set_keymap(
					"",
					"t",
					"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>",
					{}
				)
				vim.api.nvim_set_keymap(
					"",
					"T",
					"<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>",
					{}
				)
				vim.api.nvim_set_keymap("n", "nn", ":HopChar2<cr>", { silent = true, noremap = true })
				vim.api.nvim_set_keymap("n", "<space>l", ":HopLine<cr>", { silent = true, noremap = true })
			end,
		})
	end,
	setup = function() end,
}
