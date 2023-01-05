local M = {}

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local function init_packer()
	local conf = {
		compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
		max_jobs = 20,
		autoremove = true,
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "rounded" })
			end,
		},
	}
	require("packer").reset()
	require("packer").init(conf)
end

local function packer_startup(use)
	local configItems = {
		require("plugins.lsp"),
		-- require("plugins.dap"),
		require("plugins.extensions.bufferline"),
		require("plugins.ui"),
		require("plugins.languages"),
		require("plugins.editing"),
		require("plugins.navigation"),
		require("plugins.git"),
		require("plugins.theme"),
		require("plugins.tools"),
		require("plugins.utils"),
		require("plugins.neovide"),
	}
	use 'wbthomason/packer.nvim'
	use({ "L3MON4D3/LuaSnip", requires = "rafamadriz/friendly-snippets" })

	for _, m in ipairs(configItems) do
		if m.require ~= nil then
			pcall(m.require, use)
		end
	end

	-- plugins configurations
	for _, m in ipairs(configItems) do
		if m.setup ~= nil then
			m.setup()
		end
	end

end

function M.setup()
	local packer_bootstrap = ensure_packer()
	init_packer()
	pcall(require("packer").startup, packer_startup)
	-- require("packer").startup(packer_startup)
	require("packer_compiled")
	if packer_bootstrap then
		require('packer').sync()
	end
end

return M
