return {
  "lewis6991/satellite.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim",
  },
  -- config = function()
  --   require("satellite").setup({
  --     current_only = false,         -- Show scrollbar in all windows
  --     winblend = 0,                 -- Opaque background
  --     handlers = {
  --       cursor = false,            -- Don't show cursor
  --       search = true,             -- Highlight search results
  --       diagnostic = true,         -- Show diagnostics from LSP
  --       gitsigns = true,           -- Integrates with gitsigns.nvim
  --       marks = true,              -- Show marks (if desired)
  --       quickfix = false,          -- Quickfix list items
  --       trail = false,             -- Trailing whitespace
  --     },
  --     -- Optional style settings:
  --     excluded_filetypes = { "NvimTree", "lazy", "Trouble", "help" },
  --   })
  -- end,
  lazy = false,
}
