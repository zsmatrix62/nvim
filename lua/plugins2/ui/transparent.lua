return {
	"xiyaowong/nvim-transparent",
	event = "VimEnter",
	config = function()
		require("transparent").setup({
			extra_groups = {
				"all",
				"NvimTreeNormal",
				"NvimTreeStatuslineNc",
				"NeoTreeFloatNormal",
				"NeoTreeFloatNormal",
				"NeoTreeNormal",
				"NeoTreeNormalNC",
				"FidgetTask",
				"FidgetTitle",
				-- lsp saga hilight
				"SagaBorder",
				"ActionPreviewBorder",
				"CodeActionBorder",
				"FinderBorder",
				"FinderPreviewBorder",
				"DefinitionBorder",
				"HoverBorder",
				"RenameBorder",
				"DiagnosticBorder",
				"DiagnosticShowBorder",
				"CallHierarchyBorder",
				"TerminalBorder",
			},
		})
		vim.api.nvim_exec(":TransparentEnable", false)
	end,
}
