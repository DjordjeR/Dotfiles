return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,

	opts = {
		view = {
			width = 30,
			float = { enable = false },
		},
		actions = {
			open_file = {
				quit_on_open = true,
			},
		},

		hijack_netrw = true,

		update_focused_file = {
			enable = true,
			update_root = true,
		},

		diagnostics = {
			enable = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		renderer = {
			icons = {
				git_placement = "after",
				padding = " ",
			},
		},
	},
}
