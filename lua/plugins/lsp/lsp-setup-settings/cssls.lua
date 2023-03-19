local M = {}

function M.config(setup_options)
	setup_options.settings = {
		css = { validate = true },
		scss = { validate = true },
		less = { validate = true },
	}
	return setup_options
end

return M
