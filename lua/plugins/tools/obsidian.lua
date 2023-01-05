return {
	require = function(use)
		use { 'epwalsh/obsidian.nvim', tag = "v1.*", config = function()
			require("obsidian").setup({
				dir = "~/ObsidianVault",
				notes_subdir = "notes",
				daily_notes = {
					folder = "notes/dailies",
				},
				completion = {
					nvim_cmp = true, -- if using nvim-cmp, otherwise set to false
				}
			})
			vim.api.nvim_set_keymap("n", "<leader>ot", ":ObsidianToday<cr>", { silent = true, })
			vim.api.nvim_set_keymap("n", "<leader>oo", ":ObsidianOpen<cr>", { silent = true, })
			vim.api.nvim_set_keymap("n", "<leader>on", ":ObsidianNew<cr>", { silent = true, })
			vim.api.nvim_set_keymap("n", "<leader>os", ":ObsidianSearch<cr>", { silent = true, })
			vim.api.nvim_set_keymap("n", "<leader>ol", ":ObsidianLink<cr>", { silent = true, })
			vim.api.nvim_set_keymap("n", "<leader>oln", ":ObsidianLinkNew<cr>", { silent = true, })
		end }
	end
}
