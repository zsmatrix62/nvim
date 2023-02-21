return {
	require = function(_)
	end,
	-- 定义关闭其他buffer的函数
	close_other_buffers = function()
		local current_buf = vim.api.nvim_get_current_buf()
		local all_bufs = vim.api.nvim_list_bufs()
		for _, buf in ipairs(all_bufs) do
			if buf ~= current_buf then
				vim.api.nvim_buf_delete(buf, { force = true })
			end
		end
	end,
	insert_from_selection_list = function()
		local options = { "TODO", "FIXME", "WARN", "PERF", "NOTE", "INFO", "DEPRECATED" }
		vim.ui.select(options, {
			prompt = "",
		}, function(selected)
			if selected ~= nil then
				vim.api.nvim_feedkeys("i" .. selected .. ": ", "n", true)
			end
		end)
	end,
	setup = function()
		vim.keymap.set("n", "<leader>act", ":TermExec cmd='aicommits'<cr>")
		vim.api.nvim_set_keymap(
			"n",
			"<leader>co",
			":lua require('plugins.custom').close_other_buffers()<CR>",
			{ noremap = true, silent = false }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>it",
			":lua require('plugins.custom').insert_from_selection_list()<CR>",
			{ noremap = true, silent = false }
		)
	end,
}
