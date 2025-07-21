return {
  -- Neogit
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Required by neogit
      'sindrets/diffview.nvim', -- Recommended for better diffing within Neogit
    },
    config = true -- Uses default config, you can pass a table for custom settings
  },
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
-- nvim v0.8.0
     {
        "kdheepak/lazygit.nvim",
        lazy = true,
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        -- setting the keybinding for LazyGit with 'keys' is recommended in
        -- order to load the plugin when the command is run for the first time
        keys = {
            { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
        }
    }
}
