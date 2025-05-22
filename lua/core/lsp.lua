local lspconfig = require("lspconfig")

-- Python
lspconfig.pyright.setup {}

-- C/C++
lspconfig.clangd.setup {}

-- JavaScript / TypeScript
lspconfig.ts_ls.setup {}

-- HTML
lspconfig.html.setup {}

-- CSS
lspconfig.cssls.setup {}

-- Lua (for Neovim config)
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

-- Rust
lspconfig.rust_analyzer.setup {}

-- Go
lspconfig.gopls.setup {}

-- Java (JDTLS requires more setup, best to use a plugin — see below)

