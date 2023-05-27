return {
	"simrat39/rust-tools.nvim",
	-- ft = "rust",
	config = function()
		local opts = {
			tools = {
				inlay_hints = {
					auto = true,
				},
			},
			server = {
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
							runBuildScripts = { enable = true },
							buildScripts = { enable = true },
						},
						checkOnSave = {
							enable = true,
							command = "clippy",
						},
						inlayHints = {
							lifetimeElisionHints = {
								enable = true,
								useParameterNames = true,
							},
						},
						diagnostics = {
							enable = true,
							disabled = { "inactive-code" },
						},
					},
				},
			},
		}

		require("rust-tools").setup(opts)
	end,
}
