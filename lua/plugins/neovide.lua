return {
	setup = function()
		vim.cmd([[
		let g:neovide_floating_blur_amount_x = 2.0
		let g:neovide_floating_blur_amount_y = 2.0
		let g:neovide_transparency = 0.9
		let g:neovide_cursor_vfx_mode = "sonicboom"
		let g:neovide_cursor_trail_length = 5
		]])

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
	end,
}
