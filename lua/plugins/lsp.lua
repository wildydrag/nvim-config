return {
  -- Base LSP config
  { "neovim/nvim-lspconfig" },

  -- Mason core
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
      log_level = vim.log.levels.DEBUG})
    end
  },

  -- Mason LSP integration
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig"
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "clangd",        -- C/C++
          "pyright",       -- Python
          "html",          -- HTML
          "cssls",         -- CSS
          "ts_ls",      -- JS/TS (corrected name)
          "rust_analyzer", -- Rust
          "gopls",         -- Go
          "lua_ls"         -- Lua
        },
        automatic_installation = true,
      })
    end,
  },
}
