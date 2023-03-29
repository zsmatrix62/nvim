local M = {}

function M.config_nvim_cmp_lsp()
	-- setup cmp lang config
	local function init_setup_options()
		local capabilities = require("cmp_nvim_lsp").default_capabilities(
			vim.lsp.protocol.make_client_capabilities(),
			---@diagnostic disable-next-line: redundant-parameter
			{ snippetSupport = true }
		)
		return {
			capabilities = capabilities,
			settings = {},
		}
	end

	-- NOTE: auto configure servers base don manson's ensure installs
	local lspConfig = require("lspconfig")
	for _, lsp in ipairs(require("plugins2.lsp.manson.ensure_installs").servers) do
		local ok, optionModule = pcall(require, "plugins2.lsp.lsp-setup-settings." .. lsp)
		local setup_options = init_setup_options()
		if ok then
			setup_options = optionModule.config(setup_options)
		end
		lspConfig[lsp].setup(setup_options)
	end
end

function M.config_nvim_cmp()
	-- setup cmp-lsp
	local lspkind = require("lspkind")
	local luasnip = require("luasnip")
	local cmp = require("cmp")

	-- local has_words_before = function()
	-- 	local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
	-- 	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	-- end

	local has_words_before = function()
		if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
			return false
		end
		local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
	end

	local select_pre_item = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_prev_item()
		elseif luasnip.jumpable(-1) then
			luasnip.jump(-1)
		else
			fallback()
		end
	end, {
		"i",
		"s",
	})

	local select_next_item = cmp.mapping(function(fallback)
		if cmp.visible() then
			cmp.select_next_item({ behavior = cmp.SelectBehavior.Replace })
		elseif luasnip.expandable() then
			luasnip.expand()
		elseif luasnip.expand_or_jumpable() then
			luasnip.expand_or_jump()
		elseif has_words_before() then
			cmp.complete()
		else
			fallback()
		end
	end, {
		"i",
		"s",
	})

	local compare = require("cmp.config.compare")

	cmp.setup({
		sorting = {
			comparators = {
				compare.sort_text,
				compare.offset,
				compare.exact,
				compare.score,
				compare.recently_used,
				compare.locality,
				compare.kind,
				compare.length,
				compare.order,
			},
		},
		matching = {
			disallow_fuzzy_matching = false,
			disallow_partial_fuzzy_matching = false,
			disallow_partial_matching = false,
			disallow_prefix_unmatching = false,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		preselect = cmp.PreselectMode.Item,
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		-- 快捷键
		mapping = cmp.mapping.preset.insert({
			-- scroll docs
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-e>"] = cmp.mapping.abort(),

			-- accept suggestions
			["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),

			-- navigate suggestions
			["<Tab>"] = select_next_item,
			["<S-Tab>"] = select_pre_item,
			["<C-j>"] = select_next_item,
			["<C-k>"] = select_pre_item,
		}),
		formatting = {
			fields = { "kind", "abbr", "menu" },
			format = lspkind.cmp_format({
				mode = "symbol",
				symbol_map = {
					Array = "",
					Boolean = "蘒",
					Class = "",
					Color = "",
					Constructor = "",
					Enum = "",
					EnumMember = "",
					Event = "",
					Field = "",
					File = "",
					Folder = "",
					Method = "",
					Function = "",
					Interface = "",
					Module = "",
					Namespace = "",
					Null = "ﳠ",
					Number = "",
					Object = "",
					Operator = "",
					Package = "",
					Property = "",
					Reference = "",
					Snippet = "",
					String = "",
					Text = "",
					TypeParameter = "",
					Unit = "",
					Value = "",
					Variable = "",
					Keyword = " Keyword",
					Constant = "",
					Struct = "פּ",
					Copilot = "",
					TreeSitter = "",
					Dictionary = "",
					Calc = "",
				},
				before = function(entry, vim_item)
					-- copilit kind is not in lspkind
					-- manually set it
					if entry.source.name == "copilot" then
						vim_item.kind = "Copilot"
					end

					if entry.source.name == "dictionary" then
						vim_item.kind = "Dictionary"
					end
					if entry.source.name == "treesitter" then
						vim_item.kind = "TreeSitter"
					end
					if entry.source.name == "calc" then
						vim_item.kind = "Calc"
					end

					local menu = ({
						nvim_lsp = "LSP",
						emoji = "Emoji",
						path = "Path",
						calc = "Calc",
						vsnip = "Snippet",
						luasnip = "Snippet",
						buffer = "Buffer",
						copilot = "Copilot",
						treesitter = "TreeSitter",
						dictionary = "Dictionary",
					})[entry.source.name]

					if menu == "" then
						menu = entry.source.name
					end

					if menu == "-" then
						menu = ""
					end

					vim_item.menu = menu
					return vim_item
				end,
			}),
		},
		-- experimental = {
		-- 	ghost_text = true,
		-- },
		sources = {
			{ name = "copilot", priority = 1000 },
			{ name = "nvim_lsp", priority = 900 },
			{ name = "calc", priority = 900 },
			{ name = "path", priority = 900 },
			{ name = "luasnip", priority = 700 },
			{ name = "buffer", priority = 600 },
			{ name = "crates", priority = 100 },
			-- { name = "treesitter", priority = 100 },
			{
				name = "dictionary",
				keyword_length = 2,
				priority = 1,
				max_item_count = 5,
			},
		},
	})
end

return {
	{
		"hrsh7th/nvim-cmp",
		config = M.config_nvim_cmp,
		priority = 99,
		event = "BufRead",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind-nvim",
		},
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		event = "BufRead",
		priority = 1000, -- must be loaded before manson-lsp-config
		dependencies = {
			"neovim/nvim-lspconfig",
		},
	},
	{
		"saadparwaiz1/cmp_luasnip",
		event = "BufRead",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = {
					vim.fn.stdpath("config") .. "/snippets/friendly-snippets",
					vim.fn.stdpath("config") .. "/snippets/angular",
				},
			})
		end,
	},

	{ "hrsh7th/cmp-buffer", event = "BufRead" },
	{ "hrsh7th/cmp-path", event = "BufRead" },
	{
		"uga-rosa/cmp-dictionary",
		event = "BufRead",
		config = function()
			local dict = require("cmp_dictionary")
			dict.setup({})
			dict.switcher({
				["*"] = "~/.config/nvim/dicts/en.dict",
				spelllang = {
					en = "~/.config/nvim/dicts/en.dict",
				},
			})
		end,
	},

	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	priority = 60,
	-- 	event = "BufRead",
	-- 	config = function()
	-- 		require("copilot").setup({
	-- 			suggestion = { enabled = false },
	-- 			panel = { enabled = false },
	-- 		})
	-- 	end,
	-- },
	--
	-- {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	priority = 59,
	-- 	event = "BufRead",
	-- 	config = function()
	-- 		require("copilot_cmp").setup()
	-- 	end,
	-- },

	-- lsp interface and support
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
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
	},
}