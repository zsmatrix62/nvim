local M = {}

function M.config(setup_options)
	setup_options.settings["gopls"] = {
		hints = {
			assignVariableTypes = true,
			compositeLiteralFields = true,
			compositeLiteralTypes = true,
			constantValues = true,
			functionTypeParameters = true,
			parameterNames = true,
			rangeVariableTypes = true,
		},
	}
	return setup_options
end

return M
