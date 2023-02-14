local M = {
	ENSURE_INSTALLS = {
		"rust_analyzer",
		"pyright",
		"tsserver",
		"gopls",
		"cmake",
		"cssmodules_ls",
		"dockerls",
		"marksman",
		"svelte",
		-- "clangd",
		"cssls",
		"taplo",
		"angularls",
		"lua_ls",
		"jsonls",
		"bufls",
		"html",
		-- "tailwindcss",
	},
}

M.require = function(use)
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	})
end

function M.setup() -- auto install configurations
	require("mason").setup({
		ui = {
			icons = {
				server_installed = "✓",
				server_pending = "➜",
				server_uninstalled = "✗",
			},
		},
	})

	require("mason-lspconfig").setup({
		automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
		ensure_installed = M.ENSURE_INSTALLS,
	})

	require("mason-tool-installer").setup({
		ensure_installed = {
			-- formatters
			"clang-format",
			"prettier",
			"gofumpt",
			"golines",
			"rustfmt",
			"stylua",
			"buf",
			"autopep8",
			-- linters
			"pylint",
			"staticcheck",
		},
		auto_update = false,
		run_on_start = true,
		start_delay = 3000, -- 3 second delay
	})
end

return M
