return {
	setup = function()
		vim.keymap.set("n", "<leader>ai", ":TermExec cmd='aicommits'<cr>")
	end,
}
