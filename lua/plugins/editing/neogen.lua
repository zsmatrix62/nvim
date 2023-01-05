return {
	require = function(use)
		use { "danymat/neogen", config = function()
			require('neogen').setup {
				enable = true,
				snippet_engine = "luasnip"
			}

			vim.api.nvim_set_keymap("n", "<leader>nf", ":lua require('neogen').generate({type='func'})<CR>", { silent = true })
			vim.api.nvim_set_keymap("n", "<leader>nF", ":lua require('neogen').generate({type='file'})<CR>", { silent = true })
			vim.api.nvim_set_keymap("n", "<leader>nc", ":lua require('neogen').generate({type='class'})<CR>", { silent = true })
			vim.api.nvim_set_keymap("n", "<leader>nt", ":lua require('neogen').generate({type='type'})<CR>", { silent = true })
		end }
	end
}
