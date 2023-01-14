return require("utils.pluginConfig").NewConfig({
	require = function(use)
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				local actions = require("telescope.actions")
				local close_action = actions.close
				local mappings = {
					i = {
						["<esc>"] = close_action,
						["<CR>"] = actions.select_default + actions.center,
					},
					n = {
						["q"] = close_action,
						["<esc>"] = close_action,
						["<CR>"] = actions.select_default + actions.center,
					},
				}
				require("telescope").setup({
					defaults = {
						mappings = mappings,
						layout_config = {
							horizontal = { width = 0.9 },
						},
					},
					pickers = {
						find_files = { theme = "dropdown" },
						live_grep = { theme = "dropdown" },
						git_files = {
							theme = "dropdown",
						},
						diagnostics = { theme = "dropdown" },
					},
					extensions = {
						workspaces = {
							keep_insert = false,
						},
						extensions = {},
					},
					file_ignore_patterns = { "node_modules", ".cargo" },
				})

				-- telescope mappings
				vim.api.nvim_set_keymap("n", "<leader>2", ":Telescope live_grep<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "<leader>3", ":Telescope git_files<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "<leader>4", ":Telescope find_files<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "<leader>t", ":TodoTelescope<cr>", { noremap = false, silent = true })

				vim.api.nvim_set_keymap("n", "<space>2", ":Telescope live_grep<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "<space>3", ":Telescope git_files<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "<space>4", ":Telescope find_files<cr>", { silent = true })
			end,
		})
	end,
})
