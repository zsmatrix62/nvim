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
			"sql-formatter",
			"gofumpt",
			"rustfmt",
			"stylua",
			"buf",
			"autopep8",
		},

		-- if set to true this will check each tool for updates. If updates
		-- are available the tool will be updated. This setting does not
		-- affect :MasonToolsUpdate or :MasonToolsInstall.
		-- Default: false
		auto_update = false,

		-- automatically install / update on startup. If set to false nothing
		-- will happen on startup. You can use :MasonToolsInstall or
		-- :MasonToolsUpdate to install tools and check for updates.
		-- Default: true
		run_on_start = true,

		-- set a delay (in ms) before the installation starts. This is only
		-- effective if run_on_start is set to true.
		-- e.g.: 5000 = 5 second delay, 10000 = 10 second delay, etc...
		-- Default: 0
		start_delay = 3000, -- 3 second delay
	})
end

return M
