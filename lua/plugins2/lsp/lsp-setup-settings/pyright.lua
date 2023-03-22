local M = {}

local lspUtil = require("lspconfig/util")

local function getPythonPath(workspace)
	local lspUtilPath = lspUtil.path
	-- Use activated virtualenv.
	if vim.env.VIRTUAL_ENV then
		return lspUtilPath.join(vim.env.VIRTUAL_ENV, "bin", "python")
	end

	-- Find and use virtualenv in workspace directory.
	for _, pattern in ipairs({ "*", ".*" }) do
		local match = vim.fn.glob(lspUtilPath.join(workspace, pattern, "pyvenv.cfg"))
		if match ~= "" then
			return lspUtilPath.join(lspUtilPath.dirname(match), "bin", "python")
		end
	end

	-- Fallback to system Python.
	return exepath("python3") or exepath("python") or "python"
end

function M.config(setup_options)
	setup_options.settings["pyright"] = {}
	setup_options.before_init = function(_, config)
		setup_options.before_init(_, config)
		config.settings.python.pythonPath = getPythonPath(config.root_dir)
	end
	setup_options.root_dir = lspUtil.root_pattern("venv", ".venv", "main.py")
	return setup_options
end

return M
