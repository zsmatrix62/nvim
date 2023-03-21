return require("utils.pluginConfig").NewConfig({
	require = function(use)
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufRead",
			config = function()
				vim.opt.termguicolors = true
				vim.opt.list = true
				require("indent_blankline").setup({
					show_current_context = true,
					--[[ show_current_context_start = true, ]]
					space_char_blankline = " ",
					char = " ",
					space_char = " ",
					-- show_first_indent_level = true,
					-- char_highlight_list = {
					-- 	"IndentBlanklineIndent1",
					-- 	"IndentBlanklineIndent2",
					-- 	"IndentBlanklineIndent3",
					-- 	"IndentBlanklineIndent4",
					-- 	"IndentBlanklineIndent5",
					-- 	"IndentBlanklineIndent6",
					-- 	'Keyword', 'Identifier', 'Type', 'diffAdded'
					-- },
				})
			end,
		})
	end,
	setup = function()
	end,
})
