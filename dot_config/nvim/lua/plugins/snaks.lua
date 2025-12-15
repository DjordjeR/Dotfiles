-- nvim/lua/plugins/snacks.lua
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		-- 1. Dashboard
		dashboard = {
			enabled = true,
			winblend = 0,
			animation = { style = "none" },
		},

		-- 2. Picker
		picker = {
			enabled = true,
			winblend = 0,
			backdrop = false,
			animation = { style = "none" },
			explorer = {
				replace_netrw = true,
			},
		},

		-- 3. Explorer
		explorer = { enabled = true, replace_netrw = false },

		-- 4. Quality of Life
		notifier = { enabled = true, timeout = 2000 },
		statuscolumn = { enabled = true },
		words = { enabled = true }, -- Auto-highlight word under cursor
		input = { enabled = true }, -- Better UI for renaming/input
		rename = { enabled = true }, -- LSP rename integration
	},
	keys = {
		-- Top Pickers
		{
			"<leader><space>",
			function()
				Snacks.picker.smart()
			end,
			desc = "Smart Find Files",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files()
			end,
			desc = "Find Files",
		},
		{
			"<leader>fg",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Find Git Files",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep Text",
		},

		-- Explorer
		{
			"<leader>e",
			function()
				Snacks.explorer()
			end,
			desc = "File Explorer",
		},

		-- Git
		{
			"<leader>gg",
			function()
				Snacks.lazygit()
			end,
			desc = "Lazygit",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},

		-- LSP Keys
		{
			"gd",
			function()
				Snacks.picker.lsp_definitions()
			end,
			desc = "Goto Definition",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		{
			"<leader>rn",
			function()
				Snacks.rename.rename_file()
			end,
			desc = "Rename File",
		},
	},
}
