return {
	live_grep_from_project_git_root = function()
		local function is_git_repo()
			vim.fn.system("git rev-parse --is-inside-work-tree")

			return vim.v.shell_error == 0
		end

		local function get_git_root()
			local dot_git_path = vim.fn.finddir(".git", ".;")
			return vim.fn.fnamemodify(dot_git_path, ":h")
		end

		local opts = {}

		if is_git_repo() then
			opts = {
				cwd = get_git_root(),
			}
		end

		require("telescope.builtin").live_grep(opts)
	end,
}
