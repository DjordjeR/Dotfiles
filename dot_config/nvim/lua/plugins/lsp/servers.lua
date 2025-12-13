-- Capabilities (Blink + native)
local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require("blink.cmp").get_lsp_capabilities()
)

-- ─────────────────────────────────────────────────────────────
-- CLANGD
-- ─────────────────────────────────────────────────────────────
vim.lsp.config("clangd", {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  capabilities = capabilities,
})

vim.lsp.enable("clangd")

-- ─────────────────────────────────────────────────────────────
-- PYRIGHT
-- ─────────────────────────────────────────────────────────────
vim.lsp.config("pyright", {
  capabilities = capabilities,
})

vim.lsp.enable("pyright")

-- ─────────────────────────────────────────────────────────────
-- LUA
-- ─────────────────────────────────────────────────────────────
vim.lsp.config("lua_ls", {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim", "Snacks" } },
      workspace = { checkThirdParty = false },
    },
  },
})

vim.lsp.enable("lua_ls")
