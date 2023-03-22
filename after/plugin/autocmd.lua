-- group save folding
local grp_remember_fold = vim.api.nvim_create_augroup("remember foldings", { clear = true })

vim.api.nvim_create_autocmd("BufWinLeave", {
	pattern = { "*" },
	command = ":silent! mkview",
	group = grp_remember_fold,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	pattern = { "*" },
	command = ":silent! loadview",
	group = grp_remember_fold,
})

local grp_write_post = vim.api.nvim_create_augroup("write post", { clear = true })

-- auto compile packer after lua file written
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*.lua" },
	command = ":silent! PackerCompile",
	group = grp_write_post,
})

-- unset highlight
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = { "*" },
	command = ":set nohlsearch",
	group = grp_write_post,
})

-- overwrite highlight colors for indent line
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = { "*" },
	callback = function()
		vim.cmd([[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]])
		vim.cmd([[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]])
		vim.cmd([[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]])
		vim.cmd([[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]])
		vim.cmd([[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]])
		vim.cmd([[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]])
	end,
})
