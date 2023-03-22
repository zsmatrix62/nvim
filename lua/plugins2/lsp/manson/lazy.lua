
return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						server_installed = "✓",
						server_pending = "➜",
						server_uninstalled = "✗",
					},
				},
			})
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
				ensure_installed = require("plugins2.lsp.manson.ensure_installs"),
			})
		end
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- formatters
					-- "clang-format",
					"prettier",
					-- "prettierd",
					"goimports",
					"gofumpt",
					-- "golines",
					"rustfmt",
					"stylua",
					"buf",
					"autopep8",
					-- linters
					"pylint",
					-- "eslint_d",
					"staticcheck",
					"golangci-lint", -- for golangci-lint-lsp
				},
				auto_update = true,
				run_on_start = true,
				start_delay = 3000, -- 3 second delay
			})
		end
	},

}
