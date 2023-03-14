return require("utils.pluginConfig").NewConfig({
	require = function(use)
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim", { "nvim-telescope/telescope-fzf-native.nvim", run = "make" } },
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

				local telescope = require("telescope")

				telescope.setup({
					defaults = {
						mappings = mappings,
						layout_config = {
							horizontal = { width = 0.9 },
						},
					},
					pickers = {
						find_files = { theme = "dropdown_theme" },
						live_grep = { theme = "dropdown" },
						git_files = {
							theme = "dropdown",
						},
						diagnostics = { theme = "dropdown" },
					},
					extensions = {
						fzf = {
							fuzzy = true, -- false will only do exact matching
							override_generic_sorter = true, -- override the generic sorter
							override_file_sorter = true, -- override the file sorter
							case_mode = "ignore_case", -- or "ignore_case" or "respect_case"
							-- the default case_mode is "smart_case"
						},
					},
					file_ignore_patterns = { "node_modules", ".cargo" },
				})
				require("telescope").load_extension("fzf")

				-- telescope mappings
				vim.api.nvim_set_keymap("n", "<space>2", ":Telescope live_grep<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "<space>3", ":Telescope git_files<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "<space>4", ":Telescope fd<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "<leader>gib", ":Telescope git_branches<cr>", { silent = true })
				-- vim.api.nvim_set_keymap("n", "/", ":Telescope current_buffer_fuzzy_find<cr>", { silent = true })
			end,
		})
	end,
})
