return {
	require("plugins2.git.fugitive"),
	require("plugins2.git.gitsigns"),
	require("plugins2.git.blame"),
	{ "junegunn/gv.vim", event = "BufRead" },
}
