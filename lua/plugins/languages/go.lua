return require("utils.pluginConfig").NewConfig({
	require = function(packerUse)
		packerUse({ "ray-x/go.nvim" })
		packerUse({
			"edolphin-ydf/goimpl.nvim",
			requires = {
				{ "nvim-lua/plenary.nvim" },
				{ "nvim-lua/popup.nvim" },
				{ "nvim-treesitter/nvim-treesitter" },
			},
		})
	end,
	setup = function()
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
	end,
})
