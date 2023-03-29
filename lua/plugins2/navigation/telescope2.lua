return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	event = "VimEnter",
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
					width = 0.9,
				},
			},
			pickers = {
				find_files = { theme = "dropdown_theme" },
				live_grep = {
					theme = "dropdown",
				},
				git_files = {
					theme = "dropdown",
				},
				diagnostics = { theme = "dropdown" },
			},
			extensions = {},
			file_ignore_patterns = { "node_modules", ".cargo" },
		})

		-- telescope mappings
		-- vim.api.nvim_set_keymap("n", "<space>2", ":Telescope live_grep<cr>", { silent = true })
		vim.api.nvim_set_keymap(
			"n",
			"<space>2",
			":lua require('plugins2.navigation.customs.live_grep').live_grep_from_project_git_root()<cr>",
			{ silent = true }
		)
		vim.api.nvim_set_keymap("n", "<space>3", ":Telescope git_files<cr>", { silent = true })
		vim.api.nvim_set_keymap("n", "<space>4", ":Telescope fd<cr>", { silent = true })
		vim.api.nvim_set_keymap("n", "<leader>gib", ":Telescope git_branches<cr>", { silent = true })
		-- vim.api.nvim_set_keymap("n", "/", ":Telescope current_buffer_fuzzy_find<cr>", { silent = true })
	end,
}
