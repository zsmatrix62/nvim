local M = {}

function M.config(setup_options)
	setup_options.settings = {
		css = {
			lint = {
				validProperties = {},
			},
		},
	}
	return setup_options
end

return M
