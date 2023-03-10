return require "utils.pluginConfig".NewConfig({
	require = function(use)
		use({ "simrat39/rust-tools.nvim", })
	end,
	setup = function()
		local opts = {
			tools = {
				inlay_hints = {
					auto = false
				}
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
							disabled = { "inactive-code" }
						},
					},
				},
			},
		}

		require("rust-tools").setup(opts)
	end
})
