local M = {}

function M.config(setup_options)
	setup_options.settings["rust_analyer"] = {
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
	}
	return setup_options
end

return M
