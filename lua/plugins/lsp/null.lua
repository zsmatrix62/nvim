local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

return {
	require = function(use)
		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				local null_ls = require("null-ls")
				null_ls.setup({
					sources = {
						-- formatters
						null_ls.builtins.formatting.stylua,
						null_ls.builtins.formatting.prettier,
						null_ls.builtins.formatting.clang_format,
						null_ls.builtins.formatting.autopep8,
						null_ls.builtins.formatting.gofmt,
						null_ls.builtins.formatting.gofumpt,
						null_ls.builtins.formatting.goimports,
						null_ls.builtins.formatting.golines,
						null_ls.builtins.formatting.buf,
						null_ls.builtins.formatting.taplo,
						null_ls.builtins.formatting.rustfmt,
						null_ls.builtins.formatting.swiftformat,
						-- lints
						null_ls.builtins.diagnostics.pylint,
						null_ls.builtins.diagnostics.eslint_d,
						-- null_ls.builtins.diagnostics.golangci_lint,
					},
					on_attach = function(client, bufnr)
						if client.supports_method("textDocument/formatting") then
							vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
							vim.api.nvim_create_autocmd("BufWritePre", {
								group = augroup,
								buffer = bufnr,
								callback = function()
									vim.lsp.buf.format({ bufnr = 0 })
								end,
							})
						end
					end,
				})
				vim.api.nvim_set_keymap("n", "<leader>s", ":lua vim.lsp.buf.format()<cr>", { silent = true })
				vim.api.nvim_set_keymap("v", "<leader>s", ":lua vim.lsp.buf.format()<cr>", { silent = true })
			end,
		})
	end,
}
