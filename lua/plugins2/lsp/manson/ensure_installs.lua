-- NOTE: language server names can be found: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

return {
	servers = {
		"rust_analyzer",
		"pyright",
		"tsserver",
		"gopls",
		"bashls",
		"golangci_lint_ls",
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
	tools = {
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
}
