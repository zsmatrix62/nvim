return {
	require = function(use)
		use("sainnhe/everforest")
		use("sainnhe/sonokai")
		use("folke/tokyonight.nvim")
		use({ "projekt0n/github-nvim-theme" })

		use({
			"arzg/vim-colors-xcode",
			"arzg/vim-rust-syntax-ext",
			"tpope/vim-markdown",
			"cakebaker/scss-syntax.vim",
			-- "arzg/vim-swift",
			"HerringtonDarkholme/yats.vim",
			"pangloss/vim-javascript",
			"othree/html5.vim",
			-- "fatih/vim-go",
			"hail2u/vim-css3-syntax",
			"LunarVim/lunar.nvim",
		})
		vim.opt.termguicolors = true
		-- vim.cmd([[colorscheme everforest]])
		-- vim.cmd([[colorscheme sonokai]])
		-- vim.cmd([[colorscheme xcodedark]])
		vim.cmd([[colorscheme lunar]])
		-- vim.cmd([[colorscheme tokyonight-night]])
		-- vim.cmd([[colorscheme tokyonight-moon]])
		-- vim.cmd([[colorscheme github_dark]])
		-- vim.cmd([[set guifont=GoMono\ Nerd\ Font\ Mono:h14]])
		vim.cmd([[set guifont=SFMono\ Nerd\ Font:h14]])
	end,

	setup = function() end,
}
