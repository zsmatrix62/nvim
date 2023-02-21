return {
	require = function(use)
		use({
			"nvim-tree/nvim-tree.lua",
			requires = {
				"nvim-tree/nvim-web-devicons", -- optional, for file icons
			},
			tag = "nightly", -- optional, updated every week. (see issue #1193)
			config = function()
				require("nvim-tree").setup({
					view = {
						mappings = {
							custom_only = false,
							list = {
								{ key = "u",  action = "dir_up" },
								{ key = "g",  action = "toggle_git_clean" },
								{ key = "v",  action = "vsplit" },
								{ key = ".",  action = "cd" },
								{ key = "d",  action = "trash" },
								{ key = "D",  action = "trash" },
								{ key = "yy", action = "copy" },
								{ key = "p",  action = "paste" },
								-- { key = "i", action = "run_custom_command", action_cb = run_custom_command },
								-- { key = "ga", action = "git_add", action_cb = git_add },
							},
						},
						float = {
							enable = true,
							quit_on_focus_loss = true,
							open_win_config = function()
								local HEIGHT_RATIO = 0.8
								-- local WIDTH_RATIO = 0.5
								-- local screen_w = vim.opt.columns:get()
								local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
								-- local window_w = screen_w * WIDTH_RATIO
								local window_h = screen_h * HEIGHT_RATIO
								-- local window_w_int = math.floor(window_w)
								local window_h_int = math.floor(window_h)
								-- local center_x = (screen_w - window_w) / 2
								-- local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
								return {
									border = "rounded",
									relative = "editor",
									row = 2,
									col = 2,
									width = 60,
									height = window_h_int,
								}
							end,
						},
					},
					renderer = {
						icons = {
							git_placement = "after",
							glyphs = {
								git = {
									untracked = "*",
								},
							},
						},
					},
					diagnostics = {
						enable = true,
						show_on_dirs = false,
						severity = {
							min = vim.diagnostic.severity.HINT,
							max = vim.diagnostic.severity.ERROR,
						},
					},
					filters = {
						dotfiles = true,
						custom = {
							"^node_modules$",
							".+venv$",
							"^thumbs\\.db$",
						},
					},
				})

				vim.api.nvim_set_keymap("", "<space>e", ":NvimTreeFindFile<cr>", { silent = true })
				-- vim.api.nvim_set_keymap(
				-- 	"",
				-- 	"<space>r",
				-- 	":Neotree source=buffers reveal=true position=float toggle=true<cr>",
				-- 	{ silent = true }
				-- )
				--
				-- vim.api.nvim_set_keymap(
				-- 	"",
				-- 	"<space>g",
				-- 	":Neotree source=git_status reveal=true position=float toggle=true<cr>",
				-- 	{ silent = true }
				-- )
			end,
		})
	end,
}
