return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns
          local function map(mode, lhs, rhs, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, lhs, rhs, opts)
          end

          -- Keybindings
          map('n', ']c', gs.next_hunk)
          map('n', '[c', gs.prev_hunk)
          map({'n', 'v'}, '<leader>hs', gs.stage_hunk)
          map({'n', 'v'}, '<leader>hr', gs.reset_hunk)
          map('n', '<leader>hp', gs.preview_hunk)
        end,
      }
    end
  },
  { "tpope/vim-fugitive" },
  { "sindrets/diffview.nvim" },
}
