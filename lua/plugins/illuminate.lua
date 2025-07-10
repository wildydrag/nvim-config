-- In ~/.config/nvim/lua/plugins/illuminate.lua (or wherever you define your plugins)

return {
  {
    "RRethy/vim-illuminate",
    event = "BufReadPost", -- Or "VeryLazy" for the simplest setup
    config = function()
      require("illuminate").configure({
        -- Optional: Configure illuminate here.
        -- These are default values, you can change them as needed.
        delay = 200, -- Delay in milliseconds before highlighting
        large_file_cutoff = 2000, -- Don't illuminate in files larger than this many lines
        large_file_overrides = {
          providers = { "lsp" }, -- Only use LSP for large files if available
        },

      -- Custom integration with nvim-scrollview for illuminate signs
      -- This part queries illuminate's highlights and reports them to scrollview
        -- For LSP integration (recommended for code files):
        -- If you use nvim-lspconfig, you'll want to ensure
        -- illuminate's on_attach is called.
        -- This is often handled automatically by illuminate, but
        -- if you have a custom on_attach for LSP, ensure it
        -- looks something like this:
        -- on_attach = function(client, bufnr)
        --   if client.server_capabilities.documentHighlightProvider then
        --     require("illuminate").on_attach(client)
        --   end
        --   -- ... other LSP setup for this buffer
        -- end,
      })
      local illuminate_augroup = vim.api.nvim_create_augroup("IlluminateScrollView", { clear = true })
    end,
    -- Recommended keymaps for jumping between references:
    keys = {
      { "<leader>ni", function() require("illuminate").goto_next_reference(false) end, desc = "Next reference" },
      { "<leader>pi", function() require("illuminate").goto_prev_reference(false) end, desc = "Prev reference" },
    },
  },
}
