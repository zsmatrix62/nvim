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
		"sqls",
		"clangd",
		"cssls",
		"taplo",
		"angularls",
		"sumneko_lua",
		"jsonls",
		"bufls",
		"html",
	},
}

-- -- formatters
-- "clang-format",
-- "prettier",
-- "sql-formatter",
-- "go-fumpt",
-- "gofmt",
-- "goimport",
-- "rustfmt",
-- "stylua",
-- "buf",
-- "autopep8",

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
end

return M
