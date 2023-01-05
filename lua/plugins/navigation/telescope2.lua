-- local actions = require("telescope.actions")
return require("utils.pluginConfig").NewConfig({
	require = function(use)
		use({
			"nvim-telescope/telescope.nvim",
			tag = "0.1.0",
			requires = { "nvim-lua/plenary.nvim" },
			config = function()
				require("telescope").setup({
					defaults = {
						mappings = {
							i = { ["<C-u>"] = false },
						},
						layout_config = {
							horizontal = { width = 0.9 },
						},
					},
					pickers = {
						find_files = { theme = "dropdown" },
						live_grep = { theme = "dropdown" },
						git_files = { theme = "dropdown" },
						diagnostics = { theme = "dropdown" },
					},
					extensions = {
						workspaces = {
							keep_insert = true,
						},
						extensions = {
							dash = {
								-- your config here

								{
									-- configure path to Dash.app if installed somewhere other than /Applications/Dash.app
									dash_app_path = "/Applications/Dash.app",
									-- search engine to fall back to when Dash has no results, must be one of: 'ddg', 'duckduckgo', 'startpage', 'google'
									search_engine = "google",
									-- debounce while typing, in milliseconds
									debounce = 0,
									-- map filetype strings to the keywords you've configured for docsets in Dash
									-- setting to false will disable filtering by filetype for that filetype
									-- filetypes not included in this table will not filter the query by filetype
									-- check src/lua_bindings/dash_config_binding.rs to see all defaults
									-- the values you pass for file_type_keywords are merged with the defaults
									-- to disable filtering for all filetypes,
									-- set file_type_keywords = false
									file_type_keywords = {
										dashboard = false,
										NvimTree = false,
										TelescopePrompt = false,
										terminal = false,
										packer = false,
										fzf = false,
										-- a table of strings will search on multiple keywords
										javascript = { "javascript", "nodejs" },
										typescript = { "typescript", "javascript", "nodejs" },
										typescriptreact = { "typescript", "javascript", "react" },
										javascriptreact = { "javascript", "react" },
										sh = "bash",
									},
								},
							},
						},
					},
					file_ignore_patterns = { "node_modules", ".cargo" },
				})

				-- telescope mappings
				vim.api.nvim_set_keymap("n", "<leader>2", ":Telescope live_grep<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "<leader>3", ":Telescope git_files<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "<leader>4", ":Telescope find_files<cr>", { silent = true })
				-- vim.api.nvim_set_keymap("n", "<leader>d", ":Telescope diagnostics bufnr=0<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "<leader>d", ":Telescope diagnostics<cr>", { silent = true })
				vim.api.nvim_set_keymap("n", "<leader>t", ":TodoTelescope<cr>", { noremap = false, silent = true })
			end,
		})
	end,
})
