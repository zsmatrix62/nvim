return {
	{
		"folke/lsp-colors.nvim",
		event = "BufRead",
		config = function()
			require("lsp-colors").setup({
				Error = "#db4b4b",
				Warning = "#e0af68",
				Information = "#0db9d7",
				Hint = "#10B981",
			})
		end,
	},
	{
		"glepnir/lspsaga.nvim",
		event = "BufRead",
		branch = "main",
		-- commit = "66bb06771789d677ef2b7c9a0bd57941298f6a9f",
		-- after = "nvim-treesitter",
		config = function()
			require("lspsaga").setup({
				ui = {
					-- currently only round theme
					theme = "round",
					-- border type can be single,double,rounded,solid,shadow.
					border = "rounded",
					winblend = 0,
					expand = "",
					collapse = "",
					preview = " ",
					code_action = "💡",
					diagnostic = "🐞",
					incoming = " ",
					outgoing = " ",
					colors = {
						--float window normal bakcground color
						normal_bg = "#1d1536",
						--title background color
						title_bg = "#afd700",
						red = "#e95678",
						magenta = "#b33076",
						orange = "#FF8700",
						yellow = "#f7bb3b",
						green = "#afd700",
						cyan = "#36d0e0",
						blue = "#61afef",
						purple = "#CBA6F7",
						white = "#d1d4cf",
						black = "#1c1c19",
					},
				},
				symbol_in_winbar = {
					enable = true,
				},
			})

			-- preview definition
			vim.keymap.set("n", "gp", "<cmd>Lspsaga peek_definition<cr>", { silent = true, noremap = true })
			-- hover doc
			vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
			vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
			-- code action
			vim.keymap.set("n", "<leader>q", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
			vim.keymap.set("n", "<space>q", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
			-- rename
			vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", { silent = true, noremap = true })

			-- jump diagnostic
			vim.keymap.set("n", "mg", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true, noremap = true })
			vim.keymap.set("n", "ng", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true, noremap = true })
			-- or jump to error
			vim.keymap.set("n", "me", function()
				require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end, { silent = true, noremap = true })
			vim.keymap.set("n", "ne", function()
				require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
			end, { silent = true, noremap = true })

			vim.keymap.set({ "n", "t" }, [[<c-\>]], "<cmd>Lspsaga term_toggle<CR>", { silent = true, noremap = true })
			vim.keymap.set({ "n" }, [[<space>t]], "<cmd>Lspsaga outline<CR>", { silent = true, noremap = true })
		end,
	},
}
