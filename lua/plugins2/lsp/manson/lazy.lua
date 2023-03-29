-- https://github.com/neovim/nvim-lspconfig/blob/c5505c70571b094663745167d40388edd40f6450/doc/server_configurations.txtfile

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
