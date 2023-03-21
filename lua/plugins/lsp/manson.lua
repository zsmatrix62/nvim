-- NOTE: language server names can be found: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint

local M = {
	ENSURE_INSTALLS = {
		"rust_analyzer",
		"pyright",
		"tsserver",
		"gopls",
		-- "golangci_lint_ls",
		"eslint",
		-- "cmake",
		"cssmodules_ls",
		"stylelint_lsp",
		"dockerls",
		"docker_compose_language_service",
		-- "marksman",
		-- "svelte",
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

return M
