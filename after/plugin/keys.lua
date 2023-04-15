local winPrefix = "nw"
local mappings = {
	-- Move current line / block with Alt-j/k ala vscode.

	{ "i", "<A-j>", "<Esc>:m .+1<CR>==gi" },
	{ "i", "<A-k>", "<Esc>:m .-2<CR>==gi" },

	{ "n", "<A-k>", ":m .-2<CR>==" },
	{ "n", "<A-j>", ":m .+1<CR>==" },

	{ "v", "<A-j>", ":m '>+1<CR>gv-gv" },
	{ "v", "<A-k>", ":m '<-2<CR>gv-gv" },

	-- use jj to exit insert mode
	{ "n", "<leader>rr", ":LspRestart<cr>" },
	{ "i", "jj", "<Esc>" },
	{ "i", "ji", "<Esc>A;<esc>" },
	{ "n", "zz", "zt" },

	-- quick save
	{ "n", "mm", ":wa<cr>" },
	{ "n", "<space>s", ":wa<cr>" },

	-- map line start and end
	{ "n", "H", "^" },
	{ "n", "L", "$" },
	{ "v", "H", "^" },
	{ "v", "L", "$" },

	{ "n", winPrefix .. "c", "<c-w>c" },
	{ "n", winPrefix .. "=", "<c-w>=" },
	{ "n", winPrefix .. "s", "<c-w>s" },
	{ "n", winPrefix .. "v", "<c-w>v" },
	{ "n", winPrefix .. "H", "<c-w>H" },

	{ "n", winPrefix .. "J", "<c-w>J" },
	{ "n", winPrefix .. "K", "<c-w>K" },
	{ "n", winPrefix .. "L", "<c-w>L" },

	{ "n", winPrefix .. "h", "<c-w>h" },
	{ "n", winPrefix .. "j", "<c-w>j" },
	{ "n", winPrefix .. "k", "<c-w>k" },
	{ "n", winPrefix .. "l", "<c-w>l" },
	{ "n", winPrefix .. "+", "<c-w>+" },
	{ "n", winPrefix .. "-", "<c-w>-" },
	{ "n", winPrefix .. ">", "<c-w>>" },
	{ "n", winPrefix .. "<", "<c-w><" },
	-- folding
	{ "v", "<space>f", "zf" },
	-- expand folding
	{ "n", "<silent> <space>f", [[@=(foldlevel('.')?'za':"\<Space>")<CR>]] },
	-- change directory to current file
	{ "n", "ccd", ":cd %:p:h<cr>" },
	-- remove mapping of "Q" key
	{ "", "q", "<Nop>" },
	-- no highlight
	{ "", "nol", "<cmd>nohl<cr>" },
}

for _, map_config in ipairs(mappings) do
	local mode, lhs, rhs = unpack(map_config)
	vim.api.nvim_set_keymap(mode, lhs, rhs, {
		noremap = true,
		silent = true,
	})
end
