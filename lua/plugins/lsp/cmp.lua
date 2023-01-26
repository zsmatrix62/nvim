local M = {}

function M.require(use)
	use({
		"hrsh7th/cmp-nvim-lsp",
		requires = { "neovim/nvim-lspconfig" },
		after = { "nvim-lspconfig", "lspkind-nvim", "nvim-cmp" },
		config = M.config_nvim_cmp_lsp,
	})
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
	-- Copilot
	-- use({
	-- 	"zbirenbaum/copilot.lua",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		vim.defer_fn(function()
	-- 			require("copilot").setup()
	-- 		end, 100)
	-- 	end,
	-- })
	-- use({
	-- 	"zbirenbaum/copilot-cmp",
	-- 	after = { "copilot.lua" },
	-- 	config = function()
	-- 		require("copilot_cmp").setup({
	-- 			method = "getCompletionsCycling",
	-- 		})
	-- 	end,
	-- })
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
end

function M.config_nvim_cmp_lsp()
	-- setup cmp lang config
	local manson = require("plugins.lsp.manson")
	local lspConfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities(
		vim.lsp.protocol.make_client_capabilities(),
		{ snippetSupport = true }
	)

	local setup_options = {
		capabilities = capabilities,
		settings = {},
	}

	for _, lsp in ipairs(manson.ENSURE_INSTALLS) do
		local ok, optionModule = pcall(require, "plugins.lsp.lang-setup-options." .. lsp)
		if ok then
			setup_options = optionModule.config(setup_options)
		end
		lspConfig[lsp].setup(setup_options)
	end
	lspConfig["sourcekit"].setup(setup_options)

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
			{ name = "calc", priority = 900 },
			{ name = "nvim_lsp", priority = 900 },
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
