return {
	require = function(use)
		-- require termguicolors
		vim.opt.termguicolors = true

		-- use({
		-- 	"folke/tokyonight.nvim",
		-- 	config = function()
		-- 		vim.cmd([[colorscheme tokyonight]])
		-- 	end,
		-- })

		use({
			"LunarVim/lunar.nvim",
			config = function()
				vim.cmd([[colorscheme lunar]])
			end,
		})

		-- use({
		-- 	"catppuccin/nvim",
		-- 	as = "catppuccin",
		-- 	config = function()
		-- 		vim.cmd([[colorscheme catppuccin]])
		-- 	end,
		-- })

		-- use({
		-- 	"JoosepAlviste/palenightfall.nvim",
		-- 	config = function()
		-- 		vim.cmd([[colorscheme palenightfall]])
		-- 	end,
		-- })

		-- use({ "rose-pine/neovim" })
		-- use({ "rockyzhang24/arctic.nvim", requires = { "rktjmp/lush.nvim" } })
		-- use("JoosepAlviste/palenightfall.nvim")
		-- vim.cmd([[colorscheme sonokai]])
		-- vim.cmd([[colorscheme xcodedark]])
		-- vim.cmd([[colorscheme arctic]])
		-- vim.cmd([[colorscheme tokyonight-night]])
		-- vim.cmd([[colorscheme tokyonight-moon]])
		-- vim.cmd([[colorscheme github_dark]])
		-- vim.cmd([[set guifont=GoMono\ Nerd\ Font\ Mono:h14]])
		-- vim.cmd([[set guifont=SFMono\ Nerd\ Font:h14]])
		-- vim.cmd("colorscheme rose-pine")
		--

		-- no-termguicolors
		-- use({
		-- 	"sainnhe/everforest",
		-- 	config = function()
		-- 		vim.cmd([[colorscheme everforest]])
		-- 	end,
		-- })

		-- use({
		-- 	"joshdick/onedark.vim",
		-- 	config = function()
		-- 		vim.cmd([[colorscheme onedark]])
		-- 	end,
		-- })

		-- use({
		-- 	"jnurmine/Zenburn",
		-- 	config = function()
		-- 		vim.cmd([[colorscheme everforest]])
		-- 	end,
		-- })
	end,
	setup = function()
	end,
}
