local M = {}

local ms = {
	require("plugins.lsp.cmp"),
	require("plugins.lsp.keys"),
	require("plugins.lsp.manson"),
	require("plugins.lsp.ui"),
}

local function config_nvim_cmp()
	local manson = require("plugins.lsp.manson")
	manson.setup()
end

function M.setup(cb)
	require("utils.pluginConfig").SetupModules(ms)
	pcall(cb)
end

function M.require(use)
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	})
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = config_nvim_cmp,
		requires = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind-nvim",
		},
	})

	-- lsp interface and support
	use({
		"ray-x/lsp_signature.nvim",
		config = function()
			local cfg = {
				debug = false,
				log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",
				verbose = false,
				bind = true,
				doc_lines = 10,
				max_height = 12,
				max_width = 80,
				wrap = true,
				floating_window = true,
				floating_window_above_cur_line = true,
				floating_window_off_x = 1,
				floating_window_off_y = 0,
				close_timeout = 4000,
				fix_pos = false,
				hint_enable = true,
				hint_prefix = "🐼 ",
				hint_scheme = "String",
				hi_parameter = "LspSignatureActiveParameter",
				handler_opts = {
					border = "rounded",
				},
				always_trigger = false,
				auto_close_after = nil,
				extra_trigger_chars = {},
				zindex = 20,
				padding = "",
				transparency = nil,
				shadow_blend = 36,
				shadow_guibg = "Black",
				timer_interval = 200,
				toggle_key = nil,
				select_signature_key = nil,
				move_cursor_key = nil,
			}

			require("lsp_signature").setup(cfg)
		end,
	})

	require("utils.pluginConfig").RequireModules(ms, use)
end

return M
