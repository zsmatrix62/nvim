return {
	require = function(use)
		use({
			"lvimuser/lsp-inlayhints.nvim",
			config = function()
				local status_ok, inlayhints = pcall(require, "lsp-inlayhints")
				if not status_ok then
					return
				end

				inlayhints.setup({
					inlay_hints = {
						parameter_hints = {
							show = true,
							prefix = "<- ",
							separator = ", ",
							remove_colon_start = false,
							remove_colon_end = true,
						},
						type_hints = {
							-- type and other hints
							show = true,
							prefix = "",
							separator = ", ",
							remove_colon_start = false,
							remove_colon_end = false,
						},
						only_current_line = false,
						-- separator between types and parameter hints. Note that type hints are
						-- shown before parameter
						labels_separator = "  ",
						-- whether to align to the length of the longest line in the file
						max_len_align = false,
						-- padding from the left if max_len_align is true
						max_len_align_padding = 1,
						-- highlight group
						highlight = "Comment",
					},
					enabled_at_startup = true,
					debug_mode = false,
				})

				vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
				vim.api.nvim_create_autocmd("LspAttach", {
					group = "LspAttach_inlayhints",
					callback = function(args)
						if not (args.data and args.data.client_id) then
							return
						end

						local bufnr = args.buf
						local client = vim.lsp.get_client_by_id(args.data.client_id)
						inlayhints.on_attach(client, bufnr)
					end,
				})
			end,
		})
		use({
			"glepnir/lspsaga.nvim",
			branch = "main",
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
						kind = {},
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
				vim.keymap.set("n", "pg", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { silent = true, noremap = true })
				vim.keymap.set("n", "ng", "<cmd>Lspsaga diagnostic_jump_next<CR>", { silent = true, noremap = true })
				-- or jump to error
				vim.keymap.set("n", "pe", function()
					require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
				end, { silent = true, noremap = true })
				vim.keymap.set("n", "ne", function()
					require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
				end, { silent = true, noremap = true })
			end,
		})
	end,
}
