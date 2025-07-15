return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-dap.nvim",  -- Debugger integration
      "nvim-telescope/telescope-fzf-native.nvim",  -- Faster search (optional)
      build = "make",  -- Needed for fzf-native
     --Note build manually if ran into problem
            -- cd ~/.local/share/nvim/lazy/telescope-fzf-native.nvim
            -- make
    },
    cmd = "Telescope",
    keys = {  -- All keybindings defined here
      -- Classic Telescope pickers
      -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
      -- { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      -- { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Open Buffers" },
      -- { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },

      -- DAP Debugging
      { "<leader>fdb", function() require("telescope").extensions.dap.list_breakpoints() end, desc = "List Breakpoints" },
      { "<leader>fdv", function() require("telescope").extensions.dap.variables() end, desc = "Debug Variables" },
      { "<leader>fdf", function() require("telescope").extensions.dap.frames() end, desc = "Debug Frames (Call Stack)" },
      { "<leader>fdc", function() require("telescope").extensions.dap.commands() end, desc = "Debug Commands" },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          dap = {},  -- Enable DAP extension
          fzf = {  -- Optional: Fuzzy sorting (requires fzf-native)
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
          },
        },
        defaults = {
          preview = { use_delta = true },  -- Your Git diff setting
          -- mappings = {  -- Customize Telescope prompt keymaps
          --   i = {
          --     ["<C-j>"] = "move_selection_next",  -- Next item
          --     ["<C-k>"] = "move_selection_previous",  -- Prev item
          --     ["<Esc>"] = "close",  -- Exit with Esc (normal mode still works)
          --   },
          -- },
        },
      })

      -- Load extensions
      require("telescope").load_extension("dap")
      require("telescope").load_extension("fzf")  -- Only if using fzf-native
    end,
  },
}
