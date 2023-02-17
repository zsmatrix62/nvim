return {
	DiffviewToggle = function()
		local lib = require("diffview.lib")
		local view = lib.get_current_view()
		if view then
			-- Current tabpage is a Diffview; close it
			vim.cmd(":DiffviewClose")
		else
			-- No open Diffview exists: open a new one
			vim.cmd(":DiffviewOpen")
		end
	end,
	DiffviewFileHistoryToggle = function()
		local lib = require("diffview.lib")
		local view = lib.get_current_view()
		if view then
			vim.cmd(":DiffviewClose")
		else
			vim.cmd(":silent DiffviewFileHistory %")
		end
	end,
	require = function(use)
		use({
			"sindrets/diffview.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				vim.api.nvim_set_keymap("n", "dv", [[:lua require('plugins.editing.history').DiffviewToggle()<cr>]], {})
				vim.api.nvim_set_keymap(
					"n",
					"df",
					[[:lua require('plugins.editing.history').DiffviewFileHistoryToggle()<cr>]],
					{}
				)
			end,
		})

		use({
			"dinhhuy258/vim-local-history",
			branch = "master",
			run = function()
				vim.cmd(":silent! !pip3 install pynvim")
				vim.cmd(":silent! UpdateRemotePlugins")
			end,
			config = function()
				-- Local History
				local localDir = vim.fn.expand("~/.local/state/nvim/local-history")
				vim.api.nvim_command([[let g:local_history_path = ']] .. localDir .. "'")
				vim.api.nvim_set_keymap("n", "dl", [[:LocalHistoryToggle<cr>]], {})
			end,
		})
	end,
}
