local M = {}
local util = require("lspconfig.util")

function M.config(setup_options)
	setup_options.settings["angularls"] = {}
	setup_options.before_init = function(_, config)
		setup_options.before_init(_, config)
	end
	setup_options.root_dir = util.root_pattern("anglar.json", "project.json")
	return setup_options
end

return M
