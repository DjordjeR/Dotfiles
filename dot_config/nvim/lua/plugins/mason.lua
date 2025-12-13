return {
	{
		"mason-org/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			ensure_installed = {
				"clangd", -- LSP
				"clang-format", -- Formatter
				"pyright", -- LSP
				"ruff", -- Formatter
				"stylua", -- Formatter
				"rust-analyzer", -- LSP (Crucial for Rust LSP features)
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
		end,
	},
}
