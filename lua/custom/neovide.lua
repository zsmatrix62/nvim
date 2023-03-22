vim.cmd([[
		let g:neovide_floating_blur_amount_x = 2.0
		let g:neovide_floating_blur_amount_y = 2.0
		let g:neovide_transparency = 0.9
		let g:neovide_cursor_vfx_mode = "sonicboom"
		let g:neovide_cursor_trail_length = 5
		]])

if vim.g.neovide then
	vim.g.neovide_input_use_logo = 1 -- enable use of the logo (cmd) key
	vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
	vim.keymap.set("v", "<D-c>", '"+y') -- Copy
	vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
end

vim.cmd([[
		function Neovide_fullscreen()
			if g:neovide_fullscreen == v:true
				let g:neovide_fullscreen=v:false
			else
				let g:neovide_fullscreen=v:true
				endif
				endfunction

				map <C-0> :call Neovide_fullscreen()<cr>
		]])
