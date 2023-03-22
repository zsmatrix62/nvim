return {
	"feline-nvim/feline.nvim",
	event = "BufRead",
	dependencies = {
		"SmiteshP/nvim-navic",
	},
	config = function()
		vim.opt.termguicolors = true

		local vi_mode_utils = require("feline.providers.vi_mode")
		local gps = require("nvim-navic")

		local force_inactive = {
			filetypes = {},
			buftypes = {},
			bufnames = {},
		}

		local winbar_components = {
			active = { {}, {}, {} },
			inactive = { {}, {}, {} },
		}

		local components = {
			active = { {}, {}, {} },
			inactive = { {}, {}, {} },
		}

		local colors = {
			bg = "#282828",
			black = "#282828",
			yellow = "#d8a657",
			cyan = "#89b482",
			oceanblue = "#45707a",
			green = "#a9b665",
			orange = "#e78a4e",
			violet = "#d3869b",
			magenta = "#c14a4a",
			white = "#a89984",
			fg = "#a89984",
			skyblue = "#7daea3",
			red = "#ea6962",
		}

		local vi_mode_colors = {
			NORMAL = "green",
			OP = "green",
			INSERT = "red",
			CONFIRM = "red",
			VISUAL = "skyblue",
			LINES = "skyblue",
			BLOCK = "skyblue",
			REPLACE = "violet",
			["V-REPLACE"] = "violet",
			ENTER = "cyan",
			MORE = "cyan",
			SELECT = "orange",
			COMMAND = "green",
			SHELL = "green",
			TERM = "green",
			NONE = "yellow",
		}

		local vi_mode_text = {
			NORMAL = "<|",
			OP = "<|",
			INSERT = "|>",
			VISUAL = "<>",
			LINES = "<>",
			BLOCK = "<>",
			REPLACE = "<>",
			["V-REPLACE"] = "<>",
			ENTER = "<>",
			MORE = "<>",
			SELECT = "<>",
			COMMAND = "<|",
			SHELL = "<|",
			TERM = "<|",
			NONE = "<>",
			CONFIRM = "|>",
		}

		local buffer_not_empty = function()
			if vim.fn.empty(vim.fn.expand("%:t")) ~= 1 then
				return true
			end
			return false
		end

		local checkwidth = function()
			local squeeze_width = vim.fn.winwidth(0) / 2
			if squeeze_width > 40 then
				return true
			end
			return false
		end

		force_inactive.filetypes = { "NvimTree", "dbui", "packer", "startify", "fugitive", "fugitiveblame" }

		force_inactive.buftypes = { "terminal" }

		-- STATUSLINE

		-- fileIcon

		components.active = {

			-- LEFT
			{
				{
					provider = function()
						return " " .. vi_mode_utils.get_vim_mode() .. " "
					end,
					hl = function()
						local val = {}

						val.bg = vi_mode_utils.get_mode_color()
						val.fg = "black"
						val.style = "bold"

						return val
					end,
					right_sep = " ",
				},
				{
					provider = function()
						return vi_mode_text[vi_mode_utils.get_vim_mode()]
					end,
					hl = function()
						local val = {}
						val.fg = vi_mode_utils.get_mode_color()
						val.bg = "bg"
						val.style = "bold"
						return val
					end,
					right_sep = " ",
				},
				{
					provider = "git_branch",
					hl = {
						fg = "yellow",
						bg = "bg",
						style = "bold",
					},
					right_sep = " ",
				},
				{
					provider = function()
						return vim.fn.expand("%:F")
					end,
					hl = {
						fg = "white",
						bg = "bg",
						style = "bold",
					},
				},
			},
			-- MID
			{},
			-- RIGHT
			{
				{
					provider = function()
						local filename = vim.fn.expand("%:t")
						local extension = vim.fn.expand("%:e")
						local icon = require("nvim-web-devicons").get_icon(filename, extension)
						if icon == nil then
							icon = ""
						end
						return icon
					end,
					hl = function()
						local val = {}
						local filename = vim.fn.expand("%:t")
						local extension = vim.fn.expand("%:e")
						local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
						if icon ~= nil then
							val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
						else
							val.fg = "white"
						end
						val.bg = "bg"
						val.style = "bold"
						return val
					end,
					right_sep = " ",
				},
				{
					provider = "file_type",
					hl = function()
						local val = {}
						local filename = vim.fn.expand("%:t")
						local extension = vim.fn.expand("%:e")
						local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
						if icon ~= nil then
							val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
						else
							val.fg = "white"
						end
						val.bg = "bg"
						val.style = "bold"
						return val
					end,
					right_sep = " ",
				},
				{
					provider = function()
						return "" .. vim.bo.fileformat:upper() .. ""
					end,
					hl = {
						fg = "white",
						bg = "bg",
						style = "bold",
					},
					right_sep = " ",
				},
				{
					provider = "file_encoding",
					hl = {
						fg = "white",
						bg = "bg",
						style = "bold",
					},
					right_sep = " ",
				},
				{
					provider = "position",
					hl = {
						fg = "white",
						bg = "bg",
						style = "bold",
					},
					right_sep = " ",
				},
				{
					provider = "line_percentage",
					hl = {
						fg = "white",
						bg = "bg",
						style = "bold",
					},
					right_sep = " ",
				},
				{
					provider = "scroll_bar",
					hl = {
						fg = "yellow",
						bg = "bg",
					},
				},
			},
		}

		-- INACTIVE

		-- fileType
		components.inactive[1][1] = {
			provider = "file_type",
			hl = {
				fg = "black",
				bg = "cyan",
				style = "bold",
			},
			left_sep = {
				str = " ",
				hl = {
					fg = "NONE",
					bg = "cyan",
				},
			},
			right_sep = {
				{
					str = " ",
					hl = {
						fg = "NONE",
						bg = "cyan",
					},
				},
				" ",
			},
		}

		-- nvimGps
		-- winbar_components.active[1][1] = {
		-- 	provider = function()
		-- 		return gps.get_location()
		-- 	end,
		-- 	enabled = function()
		-- 		return gps.is_available()
		-- 	end,
		-- 	hl = {
		-- 		fg = "orange",
		-- 		style = "bold",
		-- 	},
		-- }

		-- MID

		-- RIGHT

		-- LspName
		winbar_components.active[2][1] = {
			provider = "lsp_client_names",
			hl = {
				fg = "yellow",
				style = "bold",
			},
			right_sep = " ",
		}

		-- INACTIVE

		-- fileType
		winbar_components.inactive[1][1] = {
			provider = "file_type",
			hl = {
				fg = "black",
				bg = "cyan",
				style = "bold",
			},
			left_sep = {
				str = " ",
				hl = {
					fg = "NONE",
					bg = "cyan",
				},
			},
			right_sep = {
				{
					str = " ",
					hl = {
						fg = "NONE",
						bg = "cyan",
					},
				},
				" ",
			},
		}

		require("feline").setup({
			theme = colors,
			-- default_bg = bg,
			-- default_fg = fg,
			vi_mode_colors = vi_mode_colors,
			components = components,
			force_inactive = force_inactive,
		})

		-- require("feline").winbar.setup({
		-- 	components = winbar_components,
		-- 	force_inactive = force_inactive,
		-- })
	end,
}
