return {
	"easymotion/vim-easymotion",
	event = "BufRead",
	config = function()
		vim.api.nvim_set_keymap("", "/", "<Plug>(easymotion-sn)", { silent = true })
	end,
}
