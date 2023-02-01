local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local h = require("null-ls.helpers")

return {
	require = function(use)
		use({
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				local null_ls = require("null-ls")

				null_ls.setup({
					debug = true,
					sources = {
						null_ls.builtins.formatting.stylua,
						null_ls.builtins.formatting.prettier,
						null_ls.builtins.formatting.clang_format,
						null_ls.builtins.formatting.autopep8.with({
							extra_args = { "--aggressive", "--aggressive" },
						}),
						null_ls.builtins.formatting.gofmt,
						null_ls.builtins.formatting.gofumpt,
						null_ls.builtins.formatting.goimports,
						null_ls.builtins.formatting.golines,
						null_ls.builtins.formatting.buf,
						null_ls.builtins.formatting.rustfmt,
						null_ls.builtins.formatting.sqlformat,
						null_ls.builtins.completion.spell,
					},
					on_attach = function(client, bufnr)
						if client.supports_method("textDocument/formatting") then
							vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
							vim.api.nvim_create_autocmd("BufWritePre", {
								group = augroup,
								buffer = bufnr,
								callback = function()
									vim.lsp.buf.format()
								end,
							})
						end
					end,
				})
			end,
		})
	end,
}
