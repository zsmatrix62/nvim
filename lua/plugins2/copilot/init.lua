vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true

return {
	"github/copilot.vim",
	event = "bufread",
	priority = 1,
	enable = false,
	config = function()
		vim.api.nvim_set_keymap("i", "<C-U>", "copilot#Accept()", { silent = true, expr = true })
		vim.api.nvim_set_keymap("i", "<C-Y>", "copilot#Previous()", { silent = true, expr = true })
		vim.api.nvim_set_keymap("i", "<C-I>", "copilot#Next()", { silent = true, expr = true })
	end,
}
