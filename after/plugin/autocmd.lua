local language_patterns = { "*.rs", "*.py", "*.sql" }
local language_patterns_neo = { "*.lua", "*.c", "*.cpp", "*.cxx", "*.cc" }
local language_patterns_go = { "*.go" }
local language_patterns_proto = { "*.proto" }
local language_patterns_prettier =
	{ "*.html", "*.css", "*.scss", "*.md", "*.tsx", "*.jsx", "*.yaml", "*.json", "*.ts", "*.js" }

-- -- Group auto save buffer
-- local grp_insert_leave = vim.api.nvim_create_augroup("insert_leave", { clear = true })

-- -- auto save on insert leave
-- vim.api.nvim_create_autocmd("InsertLeave", {
-- 	pattern = language_patterns,
-- 	command = "wa!",
-- 	group = grp_insert_leave,
-- })
vim.api.nvim_create_autocmd("BufWrite", {
	pattern = "*",
	command = "set ff=unix",
})

local grp_auto_save = vim.api.nvim_create_augroup("autosave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = language_patterns,
	command = ":lua vim.lsp.buf.format()",
	group = grp_auto_save,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = language_patterns_neo,
	command = ":Neoformat",
	group = grp_auto_save,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = language_patterns_go,
	command = [[:lua require("go.format").goimport()]],
	group = grp_auto_save,
})

-- format protobuf file: install buf binary via brew
vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = language_patterns_proto,
	command = [[:silent! !buf format -w %]],
	group = grp_auto_save,
})

--- Use external prettier command to format current buffer, and restore default cursor location.
local function prettier_fmt()
	vim.api.nvim_command(":mark z")
	vim.api.nvim_command(":silent %!prettier --stdin-filepath %")
	vim.api.nvim_command(":'z")
	vim.api.nvim_command(":delm z")
end

vim.api.nvim_create_user_command("PrettierFmt", prettier_fmt, {})
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = language_patterns_prettier,
	command = ":silent Neoformat prettier",
	group = grp_auto_save,
})

vim.api.nvim_create_autocmd("BufEnter,FileType", {
	pattern = { "*" },
	callback = function()
		local exclude_ft = {
			"qf",
			"NvimTree",
			"toggleterm",
			"TelescopePrompt",
			"alpha",
			"netrw",
			"startify",
		}

		local map = require("mini.map")
		if vim.tbl_contains(exclude_ft, vim.o.filetype) then
			vim.b.minimap_disable = true
			map.close()
		elseif vim.o.buftype == "" then
			vim.b.minimap_disable = false
			map.open()
		end
	end,
})

-- auto add git on saved file
-- vim.api.nvim_create_autocmd("BufWritePost", {
-- 	pattern = { "*" },
-- 	command = ":silent! Git add %",
-- 	group = grp_auto_save,
-- })

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
