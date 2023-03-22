return {
	require = function(use)
		use({
			"kylechui/nvim-surround",
			config = function()
				require("nvim-surround").setup({
					surrounds = {
						["h"] = {
							add = function()
								local cmd = require("nvim-surround.config").get_input("Region Comment: ")

								local t = vim.bo.filetype
								local cmt_leading = ""
								if t == "lua" then
									cmt_leading = "--"
								end

								return {
									{ cmt_leading .. " " .. "REGION " .. cmd },
									{ cmt_leading .. " " .. "ENDREGION" },
								}
							end,
						},
					},
				})
			end,
		})
	end,
}
