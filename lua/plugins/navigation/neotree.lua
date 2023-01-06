return {
	require = function(use)
		use({
			"nvim-neo-tree/neo-tree.nvim",
			git = "https://github.com/nvim-neo-tree/neo-tree.nvim.git",
			branch = "v2.x",
			requires = {
				"nvim-lua/plenary.nvim",
				"MunifTanjim/nui.nvim",
				"s1n7ax/nvim-window-picker",
			},
			config = function()
				vim.api.nvim_set_keymap(
					"",
					"<space>e",
					":Neotree source=filesystem reveal=true position=left toggle=true<cr>",
					{ silent = true }
				)

				vim.api.nvim_set_keymap(
					"",
					"<space>r",
					":Neotree source=buffers reveal=true position=left toggle=true<cr>",
					{ silent = true }
				)

				vim.api.nvim_set_keymap(
					"",
					"<space>g",
					":Neotree source=git_status reveal=true position=left toggle=true<cr>",
					{ silent = true }
				)

				require("neo-tree").setup({
					close_if_last_window = false,
					window = {
						position = "left",
						width = 40,
						mapping_options = {
							noremap = true,
							nowait = true,
						},
						mappings = {
							["<space>"] = {
								"toggle_node",
								nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
							},
							["o"] = "open",
							["l"] = "open",
							-- ["<cr>"] = "open",
							-- ["s"] = "open_split",
							-- ["v"] = "open_vsplit",
							["s"] = "split_with_window_picker",
							["v"] = "vsplit_with_window_picker",
							["t"] = "open_tabnew",
							["w"] = "open_with_window_picker",
							["C"] = "close_node",
							["z"] = "close_all_nodes",
							--["Z"] = "expand_all_nodes",
							["a"] = {
								"add",
								-- some commands may take optional config options, see `:h neo-tree-mappings` for details
								config = {
									show_path = "none", -- "none", "relative", "absolute"
								},
							},
							["A"] = "add_directory", -- also accepts the optional config.show_path option like "add".
							["d"] = "delete",
							["r"] = "rename",
							["yy"] = "copy_to_clipboard",
							["x"] = "cut_to_clipboard",
							["p"] = "paste_from_clipboard",
							["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
							-- ["c"] = {
							--  "copy",
							--  config = {
							--    show_path = "none" -- "none", "relative", "absolute"
							--  }
							--}
							["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
							["R"] = "refresh",
							["?"] = "show_help",
						},
					},
					nesting_rules = {
						["css"] = { "css.map" },
						["js"] = { "js.map" },
					},
					filesystem = {
						filtered_items = {
							visible = false, -- when true, they will just be displayed differently than normal items
							hide_dotfiles = true,
							hide_gitignored = true,
							hide_hidden = true, -- only works on Windows for hidden files/directories
							hide_by_name = {
								"node_modules",
							},
							hide_by_pattern = { -- uses glob style patterns
								--"*.meta"
							},
							never_show = { -- remains hidden even if visible is toggled to true
								".DS_Store",
								"thumbs.db",
							},
						},
						follow_current_file = false, -- This will find and focus the file in the active buffer every
						-- time the current file is changed while the tree is open.
						group_empty_dirs = false, -- when true, empty folders will be grouped together
						hijack_netrw_behavior = "open_default", -- netrw disabled, opening a directory opens neo-tree
						-- in whatever position is specified in window.position
						-- "open_current",  -- netrw disabled, opening a directory opens within the
						-- window like netrw would, regardless of window.position
						-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
						use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
						-- instead of relying on nvim autocmd events.
						window = {
							mappings = {
								["u"] = "navigate_up",
								["cd"] = "set_root",
								["zh"] = "toggle_hidden",
								["f"] = "fuzzy_finder",
								["D"] = "fuzzy_finder_directory",
								-- ["f"] = "filter_on_submit",
								["F"] = "clear_filter",
								-- ["[g"] = "prev_git_modified",
								-- ["]g"] = "next_git_modified",
							},
						},
					},
					buffers = {
						follow_current_file = true, -- This will find and focus the file in the active buffer every
						-- time the current file is changed while the tree is open.
						group_empty_dirs = true, -- when true, empty folders will be grouped together
						show_unloaded = true,
						window = {
							mappings = {
								["bd"] = "buffer_delete",
								["u"] = "navigate_up",
								["cd"] = "set_root",
							},
						},
					},
					git_status = {
						window = {
							position = "left",
							mappings = {
								["A"] = "git_add_all",
								["gu"] = "git_unstage_file",
								["ga"] = "git_add_file",
								["gr"] = "git_revert_file",
								["gc"] = "git_commit",
								["gp"] = "git_push",
								["gg"] = "git_commit_and_push",
							},
						},
					},
				})
			end,
		})
	end,
}
