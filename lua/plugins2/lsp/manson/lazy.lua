return {
	{
		"williamboman/mason.nvim",
		priority = 999,
		event = "BufRead",
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
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "BufRead",
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
				ensure_installed = require("plugins2.lsp.manson.ensure_installs").servers,
			})
		end,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "BufRead",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = require("plugins2.lsp.manson.ensure_installs").tools,
				auto_update = true,
				run_on_start = true,
				start_delay = 3000, -- 3 second delay
			})
		end,
	},
}
