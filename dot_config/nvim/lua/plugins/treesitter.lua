return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	opts = {
		ensure_installed = { "c", "cpp", "python", "lua", "json", "markdown" },
		highlight = { enable = true },
		indent = { enable = true },
	},
}
