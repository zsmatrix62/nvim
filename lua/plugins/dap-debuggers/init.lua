return require("utils.pluginConfig").NewConfig({
	require = function(use)
		use({
			"nvim-telescope/telescope-dap.nvim",
			config = function()
				require("telescope").load_extension("dap")
			end,
		})
		use({
			"rcarriga/nvim-dap-ui",
			requires = {
				"mfussenegger/nvim-dap",
				config = function()
					require("plugins.dap-debuggers.go")
					require("plugins.dap-debuggers.python")

					require("dap.ext.vscode").load_launchjs(nil, {})

					vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
					vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "", linehl = "", numhl = "" })

					-- list debug configurations
					vim.api.nvim_set_keymap(
						"n",
						"<leader>ds",
						"<cmd>Telescope dap configurations<cr>",
						{ noremap = true, silent = true }
					)

					-- list debug point list
					vim.api.nvim_set_keymap(
						"n",
						"<leader>dlt",
						"<cmd>Telescope dap list_breakpoints<cr>",
						{ noremap = true, silent = true }
					)

					-- Debug Terminate
					vim.api.nvim_set_keymap(
						"n",
						"<leader>dT",
						"<cmd>lua require('dap').terminate()<cr>",
						{ noremap = true, silent = true }
					)
					-- Debug UI
					vim.api.nvim_set_keymap(
						"n",
						"<leader>dui",
						"<cmd>lua require('dapui').toggle()<cr><cr>",
						{ noremap = true, silent = true }
					)
					-- Debug-pint Toggle
					vim.api.nvim_set_keymap(
						"n",
						"<leader>dt",
						"<cmd>lua require('dap').toggle_breakpoint()<cr>",
						{ noremap = true, silent = true }
					)

					-- Debug start/continue
					vim.api.nvim_set_keymap(
						"n",
						"<F7>",
						"<cmd>lua require('dap').continue()<cr>",
						{ noremap = true, silent = true }
					)
					-- step over
					vim.api.nvim_set_keymap(
						"n",
						"<F8>",
						"<cmd>lua  require('dap').step_over()<cr>",
						{ noremap = true, silent = true }
					)
					-- step into
					vim.api.nvim_set_keymap(
						"n",
						"<F9>",
						"<cmd>lua require('dap').step_into()<cr>",
						{ noremap = true, silent = true }
					)
					-- step out
					vim.api.nvim_set_keymap(
						"n",
						"<F10>",
						"<cmd>lua require('dap').step_out()<cr>",
						{ noremap = true, silent = true }
					)
				end,
			},
			config = function()
				local dap, dapui = require("dap"), require("dapui")

				dap.listeners.after.event_initialized["dapui_config"] = function()
					dapui.open()
				end
				dap.listeners.before.event_terminated["dapui_config"] = function()
					dapui.close()
				end
				dap.listeners.before.event_exited["dapui_config"] = function()
					dapui.close()
				end

				require("dapui").setup({
					layouts = {
						{
							elements = {
								{
									id = "scopes",
									size = 0.45,
								},
								-- {
								-- 	id = "breakpoints",
								-- 	size = 0.25,
								-- },
								-- {
								-- 	id = "stacks",
								-- 	size = 0.25,
								-- },
								{
									id = "watches",
									size = 0.45,
								},
							},
							position = "left",
							size = 40,
						},
						{
							elements = {
								{
									id = "repl",
									size = 0.5,
								},
								{
									id = "console",
									size = 0.5,
								},
							},
							position = "bottom",
							size = 10,
						},
					},
					mappings = {
						expand = { "<CR>", "o" },
						open = "O",
					},
				})
			end,
		})
	end,
})
