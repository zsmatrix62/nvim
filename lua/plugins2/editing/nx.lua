return {
	"Equilibris/nx.nvim",
	config = function()
		require("nx").setup({
			nx_cmd_root = "npx nx",
		})
	end,
}
