return {
	require = function(use)
		use({
			"TimUntersberger/neogit",
			config = function()
				local neogit = require("neogit")
				neogit.setup({})
			end,
		})
	end,
}
