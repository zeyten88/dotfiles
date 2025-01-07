return {
  "neovim/nvim-lspconfig",
  config = function()
    local lspconfig = require("lspconfig")
    local servers = { "ts_ls", "html", "cssls", "phpactor", "pyright", "gopls", "rust_analyzer", "clangd" }
    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        on_attach = function(client, bufnr)
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
        end,
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      })
    end
  end,
} 