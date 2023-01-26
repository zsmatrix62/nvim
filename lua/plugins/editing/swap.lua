local DEFAUTL_SETTINGS = {
	allowed_separators = {
		",",
		";",
		"and",
		"or",
		"&&",
		"&",
		"||",
		"|",
		"==",
		"===",
		"!=",
		"!==",
		"-",
		"+",
		["<"] = ">",
		["<="] = ">=",
		[">"] = "<",
		[">="] = "<=",
	},
	use_default_keymaps = true,
	keymaps = {
		-- ["<C-.>"] = "swap_with_right",
		-- ["<C-,>"] = "swap_with_left",
		["<space>."] = "swap_with_right_with_opp",
		["<space>,"] = "swap_with_left_with_opp",
	},
	ignore_injected_langs = false,
}

return {
	require = function(use)
		use({
			"Wansmer/sibling-swap.nvim",
			requires = { "nvim-treesitter" },
			config = function()
				require("sibling-swap").setup(DEFAUTL_SETTINGS)
			end,
		})
	end,
}
