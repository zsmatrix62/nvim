return {
	setup = function()
		vim.api.nvim_set_keymap("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", { silent = true })
		vim.api.nvim_set_keymap("n", "<leader>gi", "<cmd>Telescope lsp_implementations<cr>", { silent = true })
		-- goto reference
		vim.api.nvim_set_keymap("n", "gr", "<cmd>Telescope lsp_references<cr>", { silent = true })
		-- goto definition
		vim.api.nvim_set_keymap("n", "gd", "<cmd>Telescope lsp_definitions theme=dropdown<cr>", { silent = true })
		-- search doc symbols
		vim.api.nvim_set_keymap("n", "<space>v", ":Telescope lsp_document_symbols<cr>", { silent = true })
		-- search workspace symbols
		vim.api.nvim_set_keymap("n", "<space>b", ":Telescope lsp_dynamic_workspace_symbols<cr>", { silent = true })
		vim.api.nvim_set_keymap("n", "<leader>hint", ":lua require('lsp-inlayhints').toggle()<cr>", { silent = true })
	end,
}
