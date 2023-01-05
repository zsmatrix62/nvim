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
				---@diagnostic disable: undefined-global, redefined-local
				require("lspsaga").init_lsp_saga({})

				-- hover doc
				-- local action = require("lspsaga.action")
				vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })
				-- -- scroll down hover doc or scroll in definition preview
				-- vim.keymap.set("n", "<C-f>", function()
				-- 	action.smart_scroll_with_saga(1)
				-- end, { silent = true })
				-- -- scroll up hover doc
				-- vim.keymap.set("n", "<C-b>", function()
				-- 	action.smart_scroll_with_saga(-1)
				-- end, { silent = true })
				vim.keymap.set("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

				-- code action
				local action = require("lspsaga.codeaction")
				vim.keymap.set("n", "<leader>q", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
				-- rename
				vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", { silent = true, noremap = true })

				-- preview definition
				vim.keymap.set("n", "gd", "<cmd>Lspsaga peek_definition<cr>", { silent = true, noremap = true })

				-- jump diagnostic
				vim.keymap.set("n", "[g", require("lspsaga.diagnostic").goto_prev, { silent = true, noremap = true })
				vim.keymap.set("n", "]g", require("lspsaga.diagnostic").goto_next, { silent = true, noremap = true })

				-- or jump to error
				vim.keymap.set("n", "[e", function()
					require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR })
				end, { silent = true, noremap = true })
				vim.keymap.set("n", "]e", function()
					require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR })
				end, { silent = true, noremap = true })
			end,
		})
		use({
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			config = function()
				-- Disable virtual_text since it's redundant due to lsp_lines.
				vim.diagnostic.config({ virtual_text = false })
				require("lsp_lines").setup()
			end,
		})
	end,
}
