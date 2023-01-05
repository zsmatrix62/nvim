return {
	require = function(use)
		use({ "cappyzawa/trim.nvim", config = function()
			require("trim").setup({
				disable = { "markdown" },
				patterns = {
					[[%s/\s\+$//e]], -- remove unwanted spaces
					-- [[%s/\($\n\s*\)\+\%$//]], -- trim last line
					-- [[%s/\%^\n\+//]], -- trim first line
					[[%s/\(\n\n\)\n\+/\1/]], -- replace multiple blank lines with a single line
				},

				trim_trailing = true,
				trim_last_line = true,
				trim_first_line = true,

			})

		end })

		use({ "mcauley-penney/tidy.nvim", config = function()
			require("tidy").setup()
		end })

		use { 'sbdchd/neoformat', run = "npm install --global prettier" }
		use({ "ckipp01/stylua-nvim", run = "cargo install stylua" })
	end
}
