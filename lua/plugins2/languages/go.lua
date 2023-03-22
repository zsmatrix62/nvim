return {


	{
		"ray-x/go.nvim",
		ft = "go",
		config = function()
			require("go").setup({
				goimport = "goimports",
				gofmt = "gofumpt",
				lsp_gofumpt = true,
				lsp_inlay_hints = {
					enable = false,
				},
			})
			require("telescope").load_extension("goimpl")
			vim.api.nvim_set_keymap(
				"n",
				"<leader>goim",
				[[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]],
				{ noremap = true, silent = true }
			)
		end
	},
	{
		"edolphin-ydf/goimpl.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		ft = "go",
	}
}
