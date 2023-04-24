local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "BufRead",
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				debug = true,
				sources = {
					-- lints
					-- null_ls.builtins.diagnostics.pylint,
					-- null_ls.builtins.diagnostics.eslint_d,
					-- formatters
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.prettier,
					-- null_ls.builtins.formatting.prettierd,
					-- null_ls.builtins.formatting.clang_format,
					-- null_ls.builtins.formatting.autopep8,
					null_ls.builtins.formatting.gofmt,
					null_ls.builtins.formatting.gofumpt,
					null_ls.builtins.formatting.goimports,
					-- null_ls.builtins.formatting.golines,
					null_ls.builtins.formatting.buf,
					-- null_ls.builtins.formatting.taplo,
					null_ls.builtins.formatting.rustfmt,
					-- null_ls.builtins.formatting.swiftformat,
					-- null_ls.builtins.formatting.eslint,
					-- null_ls.builtins.formatting.eslint_d,
					null_ls.builtins.diagnostics.golangci_lint,
					null_ls.builtins.diagnostics.staticcheck,
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								require("custom-functions.format").format(bufnr)
							end,
						})
					end
				end,
			})
			vim.api.nvim_set_keymap(
				"n",
				"<leader>s",
				":lua require('custom-functions.format').format(0)<cr>",
				{ silent = true }
			)
			vim.api.nvim_set_keymap(
				"v",
				"<leader>s",
				":lua require('custom-functions.format').format(0)<cr>",
				{ silent = false }
			)
		end,
	},
}
