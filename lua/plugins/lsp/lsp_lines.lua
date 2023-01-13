-- Show diagnostic lines in detial mode
return {
	require = function(use)
		use({
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			config = function()
				-- Disable virtual_text since it's redundant due to lsp_lines.
				vim.diagnostic.config({ virtual_text = false })
				require("lsp_lines").setup()
			end,
		})
	end,
}
