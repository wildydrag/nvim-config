local lspconfig = require("lspconfig")

-- Python
lspconfig.pyright.setup({
  python = {
    pythonPath = "/home/emad-changizi/myenv/bin/python"
  }
})

-- C/C++
lspconfig.clangd.setup {}

-- JavaScript / TypeScript
lspconfig.ts_ls.setup {}

-- HTML
lspconfig.html.setup {}

-- CSS
lspconfig.cssls.setup {}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require'
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Rust
lspconfig.rust_analyzer.setup {}

-- Go
lspconfig.gopls.setup {}

-- Java (JDTLS requires more setup, best to use a plugin — see below)

