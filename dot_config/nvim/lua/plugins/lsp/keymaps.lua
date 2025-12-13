vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local buf = args.buf
    local opts = { buffer = buf }

    -- Snacks navigation
    vim.keymap.set("n", "gd", function() Snacks.picker.lsp_definitions() end, opts)
    vim.keymap.set("n", "gr", function() Snacks.picker.lsp_references() end, opts)
    vim.keymap.set("n", "gI", function() Snacks.picker.lsp_implementations() end, opts)
    vim.keymap.set("n", "gy", function() Snacks.picker.lsp_type_definitions() end, opts)
    vim.keymap.set("n", "<leader>ss", function() Snacks.picker.lsp_symbols() end, opts)

    -- Actions
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>cr", function() Snacks.rename.rename_file() end, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

    -- Manual format
    vim.keymap.set("n", "<leader>cf", function()
      require("conform").format({ async = true })
    end, opts)

    -- Native inlay hints (0.11)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = buf })
    end
  end,
})
