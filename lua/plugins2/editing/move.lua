return {
	"fedepujol/move.nvim",
	event = "BufRead",
	config = function()
		vim.api.nvim_set_keymap("n", "<S-Up>", ":MoveLine(-1)<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<S-Down>", ":MoveLine(1)<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("v", "<S-Up>", ":MoveBlock(-1)<cr>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("v", "<S-Down>", ":MoveBlock(1)<cr>", { noremap = true, silent = true })
	end,
}
