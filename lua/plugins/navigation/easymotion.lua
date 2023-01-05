return {
	require = function(use)
		use {
			"easymotion/vim-easymotion",
			config = function()
				vim.api.nvim_set_keymap("", "/", "<Plug>(easymotion-sn)", { silent = true, })
			end
		}
	end,
	setup = function()
	end
}
