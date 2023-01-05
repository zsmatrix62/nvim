local M = {}

local defaultConfig = {
	require = function(_) end,
	setup = nil
}

function M.NewConfig(update)
	local config = vim.tbl_extend('force', defaultConfig, update)
	return config
end

function M.SetupModules(modules)
	if modules == nil then
return
	end
	for _, m in ipairs(modules) do
		if m.setup ~= nil then
			m.setup()
		end
	end
end

function M.RequireModules(modules, use)
	if modules == nil then
return
	end
	for _, m in ipairs(modules) do
		if m.require ~= nil then
			m.require(use)
		end
	end
end

return M
