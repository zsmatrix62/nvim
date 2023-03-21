local M = {}

local ms = {
	require("plugins.lsp.cmp"),
	require("plugins.lsp.keys"),
	require("plugins.lsp.manson"),
	require("plugins.lsp.ui"),
	require("plugins.lsp.null"),
	-- require("plugins.lsp.inlayhints"),
}

function M.require(use)
	require("utils.pluginConfig").RequireModules(ms, use)
end

function M.setup(cb)
	require("utils.pluginConfig").SetupModules(ms)
	pcall(cb)
end

return M
