local M = {}

function M.require(use)
	use({
		"hrsh7th/nvim-cmp",
		config = M.config_nvim_cmp,
		requires = {
			"L3MON4D3/LuaSnip",
			"rafamadriz/friendly-snippets",
			"onsails/lspkind-nvim",
			"neovim/nvim-lspconfig",
			{
				"hrsh7th/cmp-nvim-lsp",
				config = M.config_nvim_cmp_lsp,
			},
		},
	})

	-- cmp sources
	use({ "ray-x/cmp-treesitter", after = "nvim-cmp" })
	use({
		"saecki/crates.nvim",
		after = "nvim-cmp",
		tag = "v0.2.1",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("crates").setup()
		end,
	})
	use({
		"saadparwaiz1/cmp_luasnip",
		after = "nvim-cmp",
		config = function()
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = {
					vim.fn.stdpath("config") .. "/snippets/friendly-snippets",
					vim.fn.stdpath("config") .. "/snippets/angular",
				},
			})
		end,
	})
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-calc", after = "nvim-cmp" })
	use({ "amarakon/nvim-cmp-buffer-lines", after = "nvim-cmp" })
	use({
		"uga-rosa/cmp-dictionary",
		after = "nvim-cmp",
		config = function()
			require("cmp_dictionary").setup({
				dic = {
					["*"] = "~/.config/nvim/dicts/en.dict",
					spelllang = {
						en = "~/.config/nvim/dicts/en.dict",
					},
				},
			})
		end,
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
end

function M.config_nvim_cmp_lsp()
	-- setup cmp lang config
	local manson = require("plugins.lsp.manson")
	local lspConfig = require("lspconfig")

	local function init_setup_options()
		local capabilities = require("cmp_nvim_lsp").default_capabilities(
			vim.lsp.protocol.make_client_capabilities(),
			{ snippetSupport = true }
		)
		return {
			capabilities = capabilities,
			settings = {},
		}
	end

	for _, lsp in ipairs(manson.ENSURE_INSTALLS) do
		local ok, optionModule = pcall(require, "plugins.lsp.lsp-setup-settings." .. lsp)
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

	local has_words_before = function()
		local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
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
			-- cmp.select_next_item()
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

	cmp.setup({
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},

		preselect = cmp.PreselectMode.None,
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		-- 快捷键
		mapping = cmp.mapping.preset.insert({
			["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
			["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
			["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
			["<C-e>"] = cmp.mapping.abort(),
			-- ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			["<CR>"] = cmp.mapping.confirm({
				-- this is the important line
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			}),
			["<Tab>"] = select_next_item,
			["<C-n>"] = select_next_item,
			["<S-Tab>"] = select_pre_item,
			["<C-p>"] = select_pre_item,
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
					Constant = "",
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
					-- Keyword = "",
					Module = "",
					Namespace = "",
					Null = "ﳠ",
					Number = "",
					Object = "",
					Operator = "",
					Package = "",
					Property = "",
					Reference = "",
					-- Snippet = "",
					String = "",
					-- Struct = "",
					Text = "",
					TypeParameter = "",
					Unit = "",
					Value = "",
					Variable = "",

					-- Text = " Text",
					-- Method = " Method",
					-- Function = " Func",
					-- Constructor = " Constructor",
					-- Field = "ﰠ Field",
					-- Variable = " Var",
					-- Class = "ﴯ Class",
					-- Interface = " Interface",
					-- Module = " Module",
					-- Property = "ﰠ Property",
					-- Unit = "塞 Unit",
					-- Value = " Value",
					-- Enum = " Enum",
					Keyword = " Keyword",
					Snippet = "",
					-- Color = "",
					-- File = "",
					-- Reference = "",
					-- Folder = "",
					-- EnumMember = " EnumMember",
					-- Constant = "",
					Struct = "פּ",
					-- Event = " Event",
					-- Operator = "",
					-- TypeParameter = "",
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
						nvim_lsp = "(LSP)",
						emoji = "(Emoji)",
						path = "(Path)",
						calc = "(Calc)",
						cmp_tabnine = "(Tabnine)",
						vsnip = "(Snippet)",
						luasnip = "(Snippet)",
						buffer = "(Buffer)",
						tmux = "(TMUX)",
						copilot = "(Copilot)",
						treesitter = "(TreeSitter)",
						dictionary = "(Dictionary)",
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
		sources = {
			{ name = "nvim_lsp", priority = 900 },
			{ name = "calc", priority = 900 },
			{ name = "path", priority = 900 },
			{ name = "luasnip", priority = 700 },
			{ name = "buffer", priority = 600 },
			{ name = "crates", priority = 100 },
			{ name = "treesitter", priority = 100 },
			{
				name = "dictionary",
				keyword_length = 2,
				priority = 1,
			},
		},
	})
end

return M
