return {
	"glepnir/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			-- config
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{
						desc = "  Lazy",
						group = "Number",
						action = "Lazy sync",
						key = "u",
					},
				},
				packages = { enable = false },
				project = {
					limit = 8,
					enable = true,
					icon = " ",
					icon_hl = "DashboardRecentProjectIcon",
					action = "Neotree source=filesystem reveal=true position=float toggle=true  reveal_force_cwd=true dir=",
					label = " Recent Projects:",
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
