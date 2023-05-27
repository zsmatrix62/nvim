-- NOTE: language server names can be found: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

return {
	servers = {
		"rust_analyzer",
		-- "pyright",
		"tsserver",
		"gopls",
		-- "bashls",
		"eslint",
		-- "astro",
		-- "cssmodules_ls",
		"dockerls",
		"docker_compose_language_service",
		"svelte",
		-- "clangd",
		"cssls",
		"taplo",
		"angularls",
		"lua_ls",
		"jsonls",
		"bufls",
		"html",
		"tailwindcss",
	},
	tools = {
		-- formatters
		-- "clang-format",
		"prettier",
		"nxls",
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
		"golangci-lint",
	},
}
