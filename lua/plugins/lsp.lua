return {
  -- Base LSP config
  { "neovim/nvim-lspconfig" },

  -- Mason: LSP installer
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true
  },

  -- Auto configure installed LSPs
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",        -- C/C++
          "pyright",       -- Python
          "html",          -- HTML
          "cssls",         -- CSS
          "ts_ls",      -- JS/TS
          "rust_analyzer", -- Rust
          "gopls",         -- Go
        },
        automatic_installation = true,
      })
    end,
  },
}

