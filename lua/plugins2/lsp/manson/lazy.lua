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
		priority = 998,
		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
				ensure_installed = require("plugins2.lsp.manson.ensure_installs").servers,
			})

			-- automatically setup lsp servers
			local capabilities =
				require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

			local setup_options = {
				capabilities = capabilities,
				settings = {},
			}

			local masonhandlersOptions = {
				function(server_name) -- default handler (optional)
					for _, lsp in ipairs(require("plugins2.lsp.manson.ensure_installs").servers) do
						local ok, optionModule = pcall(require, "plugins2.lsp.lsp-setup-settings." .. lsp)
						if ok then
							setup_options = optionModule.config(setup_options)
							require("lspconfig")[server_name].setup(setup_options)
						end
					end
				end,
			}

			require("mason-lspconfig").setup_handlers(masonhandlersOptions)
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
