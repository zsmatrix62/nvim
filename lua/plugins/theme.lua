return {
	require = function(use)
		use("sainnhe/everforest")
		use("folke/tokyonight.nvim")
		use({ "LunarVim/lunar.nvim" })
		use({ "rose-pine/neovim" })
		use({ "rockyzhang24/arctic.nvim", requires = { "rktjmp/lush.nvim" } })
		vim.opt.termguicolors = true
		-- vim.cmd([[colorscheme everforest]])
		-- vim.cmd([[colorscheme sonokai]])
		-- vim.cmd([[colorscheme xcodedark]])
		-- vim.cmd([[colorscheme lunar]])
		vim.cmd([[colorscheme arctic]])
		-- vim.cmd([[colorscheme tokyonight-night]])
		-- vim.cmd([[colorscheme tokyonight-moon]])
		-- vim.cmd([[colorscheme github_dark]])
		-- vim.cmd([[set guifont=GoMono\ Nerd\ Font\ Mono:h14]])
		-- vim.cmd([[set guifont=SFMono\ Nerd\ Font:h14]])
		-- vim.cmd("colorscheme rose-pine")
	end,

	setup = function() end,
}
