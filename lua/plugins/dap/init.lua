return {
	require = function(use)
		use({
			"mfussenegger/nvim-dap",
			requires = { "nvim-telescope/telescope-dap.nvim", "leoluz/nvim-dap-go" },
		})

		-- dap ui
		use({
			"rcarriga/nvim-dap-ui",
			requires = { "mfussenegger/nvim-dap" },
		})
	end,

	setup = function()
		-- configure languages
		require("dap-go").setup()
		-- telescope
		require("telescope").load_extension("dap")

		local dapui = require("dapui")
		-- key mappings
		vim.keymap.set("n", "<space>dd", ":lua require'dap'.toggle_breakpoint()<cr>", { silent = true, noremap = true })
		vim.keymap.set("n", "<space>dc", ":lua require'dap'.continue()<cr>", { silent = true })
		vim.keymap.set("n", "<space>ds", ":lua require'dap'.close()<cr>", { silent = true })
		vim.keymap.set("n", "<space>dtr", ":lua require'dap'.run_to_cursor()<cr>", { silent = true })
		vim.keymap.set("n", "<space>8", ":lua require'dap'.step_over()<cr>", { silent = true })
		vim.keymap.set("n", "<space>9", ":lua require'dap'.step_into()<cr>", { silent = true })
		vim.keymap.set("n", "<space>0", ":lua require'dap'.step_out()<cr>", { silent = true })
		vim.keymap.set("n", "<space>dfs", ':lua require("dapui").float_element("repl")<cr>', { silent = true })

		-- dap ui configs

		require("dapui").setup({
			icons = { expanded = "", collapsed = "", current_frame = "" },
			mappings = {
				-- Use a table to apply multiple mappings
				expand = { "<CR>", "<2-LeftMouse>" },
				open = "o",
				remove = "d",
				edit = "e",
				repl = "r",
				toggle = "t",
			},
			-- Use this to override mappings for specific elements
			element_mappings = {
				-- Example:
				-- stacks = {
				--   open = "<CR>",
				--   expand = "o",
				-- }
			},
			expand_lines = vim.fn.has("nvim-0.7") == 1,
			layouts = {
				{
					elements = {
						-- Elements can be strings or table with id and size keys.
						{ id = "scopes", size = 0.25 },
						"breakpoints",
						"stacks",
						"watches",
					},
					size = 40, -- 40 columns
					position = "left",
				},
				{
					elements = {
						"repl",
						"console",
					},
					size = 0.25, -- 25% of total lines
					position = "bottom",
				},
			},
			controls = {
				enabled = true,
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
				},
			},
			floating = {
				max_height = nil, -- These can be integers or a float between 0 and 1.
				max_width = nil, -- Floats will be treated as percentage of your screen.
				border = "single", -- Border style. Can be "single", "double" or "rounded"
				mappings = {
					close = { "q", "<Esc>" },
				},
			},
			windows = { indent = 1 },
			render = {
				max_type_length = nil, -- Can be integer or nil.
				max_value_lines = 100, -- Can be integer or nil.
			},
		})

		-- open automactially
		-- local dap, dapui = require("dap"), require("dapui")
		-- dap.listeners.after.event_initialized["dapui_config"] = function()
		-- 	dapui.open()
		-- end
		-- dap.listeners.before.event_terminated["dapui_config"] = function()
		-- 	dapui.close()
		-- end
		-- dap.listeners.before.event_exited["dapui_config"] = function()
		-- 	dapui.close()
		-- end
	end,
}
