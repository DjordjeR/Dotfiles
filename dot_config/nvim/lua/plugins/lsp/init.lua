return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      "williamboman/mason-lspconfig.nvim",
      "stevearc/conform.nvim", -- dependency only
    },
    config = function()
      require("plugins.lsp.diagnostics")
      require("plugins.lsp.servers")
      require("plugins.lsp.keymaps")
    end,
  },
}
