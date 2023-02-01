vim.o.foldmethod = "manual"
vim.o.ignorecase = true
vim.o.cursorline = true
vim.o.encoding = "UTF-8"
vim.o.softtabstop = 2
vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.autoindent = true
vim.o.wildmode = "list:full"
vim.o.mouse = "a"
vim.o.background = "dark"
vim.o.number = true
vim.o.relativenumber = true

vim.opt.iskeyword:append("-")

vim.api.nvim_command("set nohlsearch")
vim.api.nvim_command("noswapfile")
vim.api.nvim_command("set mouse-=a")

vim.api.nvim_command("set cursorline")
vim.api.nvim_command("set cursorcolumn")

vim.api.nvim_command("set splitright")
vim.api.nvim_command("set splitbelow")

vim.api.nvim_command("set fileformat=unix")
vim.api.nvim_command("set fileformats=unix")

-- neovim configs
-- vim.lsp.log_levels = "DEBUG"

-- Diagnostic Icons
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

vim.api.nvim_exec(
	[[
let g:python3_host_prog = "/usr/local/bin/python"
]],
	true
)
--  Default scroll off
vim.api.nvim_exec(
	[[
set scrolloff=5
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/4
augroup END
]],
	true
)
