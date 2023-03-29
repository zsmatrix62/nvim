return {
	"williamboman/mason-lspconfig.nvim",
	event = "BufRead",
	priority = 998,
	config = function()
		require("mason-lspconfig").setup({
			automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
			ensure_installed = require("plugins2.lsp.manson.ensure_installs").servers,
		})

		-- automatically setup lsp servers
		local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

		local setup_options = {
			capabilities = capabilities,
			settings = {},
		}

		local masonhandlersOptions = {
			function(server_name) -- default handler (optional)
				local ok, optionModule = pcall(require, "plugins2.lsp.lsp-setup-settings." .. server_name)
				local overwrittenOptions = {}
				if ok then
					overwrittenOptions = optionModule.config(setup_options)
				end
				require("lspconfig")[server_name].setup(overwrittenOptions)
			end,
		}

		require("mason-lspconfig").setup_handlers(masonhandlersOptions)
	end,
}
