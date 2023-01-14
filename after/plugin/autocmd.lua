-- -- Group auto save buffer

local grp_auto_save = vim.api.nvim_create_augroup("autosave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	command = ":Neoformat",
	group = grp_auto_save,
})

local grp_insert_leave = vim.api.nvim_create_augroup("insert_leave", { clear = true })
-- -- auto save on insert leave
vim.api.nvim_create_autocmd("InsertLeave", {
	pattern = "*",
	command = ":silent Neoformat | wa!",
	group = grp_insert_leave,
})

vim.api.nvim_create_autocmd("BufWrite", {
	pattern = "*",
	command = "set ff=unix",
})

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
