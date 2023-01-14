-- key mappings
local keymap = vim.api.nvim_set_keymap
local keymapopts = {
	noremap = true,
	silent = true,
}

-- use jj to exit insert mode
keymap("i", "jj", "<Esc>", keymapopts)

keymap("i", "ji", "<Esc>A;<esc>", keymapopts)

-- quick save
keymap("n", "mm", ":silent Neoformat | wa<cr>", { silent = true, noremap = false })

local winPrefix = "nw"
keymap("n", winPrefix .. "c", "<c-w>c", keymapopts)
keymap("n", winPrefix .. "=", "<c-w>=", keymapopts)
keymap("n", winPrefix .. "s", "<c-w>s", keymapopts)
keymap("n", winPrefix .. "v", "<c-w>v", keymapopts)
keymap("n", winPrefix .. "H", "<c-w>H", keymapopts)
keymap("n", winPrefix .. "J", "<c-w>J", keymapopts)
keymap("n", winPrefix .. "K", "<c-w>K", keymapopts)
keymap("n", winPrefix .. "L", "<c-w>L", keymapopts)

-- keymap("n", "<tab>", "<c-w>w", keymapopts)
keymap("n", winPrefix .. "h", "<c-w>h", keymapopts)
keymap("n", winPrefix .. "j", "<c-w>j", keymapopts)
keymap("n", winPrefix .. "k", "<c-w>k", keymapopts)
keymap("n", winPrefix .. "l", "<c-w>l", keymapopts)
-- keymap("n", "K", "<c-w>+", keymapopts)
-- keymap("n", "J", "<c-w>-", keymapopts)
-- keymap("n", "L", "<c-w>>", keymapopts)
-- keymap("n", "J", "<c-w><", keymapopts)
keymap("n", winPrefix .. "+", "<c-w>+", keymapopts)
keymap("n", winPrefix .. "-", "<c-w>-", keymapopts)
keymap("n", winPrefix .. ">", "<c-w>>", keymapopts)
keymap("n", winPrefix .. "<", "<c-w><", keymapopts)

keymap("n", "nm", "<c-d>", keymapopts)
keymap("n", "nb", "<c-u>", keymapopts)

-- folding
keymap("v", "<space>f", "zf", { silent = false, noremap = true })
keymap("n", "<silent> <space>f", [[@=(foldlevel('.')?'za':"\<Space>")<CR>]], { silent = false, noremap = true })

-- change directory to current file
keymap("n", "ccd", ":cd %:p:h<cr>", { silent = false })

-- remove mapping of "Q" key
keymap("", "q", "<Nop>", { silent = true })

-- -- Custom vim functions
-- local vimp = require("vimp")
-- -- Toggle
-- vimp.nnoremap("<leader>n", function()
-- 	vim.o.number = not vim.o.number
-- 	vim.o.relativenumber = vim.o.number
-- end)
