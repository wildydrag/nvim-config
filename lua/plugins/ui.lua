return {
         -- Example using LazyVim
   {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,  -- Default: transparency enabled
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      local tokyonight = require("tokyonight")
      tokyonight.setup(opts)
      vim.cmd.colorscheme("tokyonight")

      -- Add a toggle function
      local function toggle_transparency()
        local current_transparency = vim.g.tokyonight_transparency or opts.transparent
        vim.g.tokyonight_transparency = not current_transparency

        -- Reapply the colorscheme with updated transparency
        tokyonight.setup({ transparent = vim.g.tokyonight_transparency })
        vim.cmd.colorscheme("tokyonight")
      end

      -- Create a command to toggle transparency
      vim.api.nvim_create_user_command("ToggleTransparency", toggle_transparency, {})
    end,
  },
    {"catppuccin/nvim", name = "catppuccin"},
    {"ellisonleao/gruvbox.nvim"},
    { "rose-pine/neovim", name = "rose-pine" },
    {"shaunsingh/nord.nvim", name = "nord"},

    {"AlexvZyl/nordic.nvim", name = "nordic",
        lazy = false,
        priority = 1000,
        config = function()
            require('nordic').load()
        end,
    },
    
    {
        "nvim-tree/nvim-web-devicons",
        opts = {}

    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("lualine").setup({
                options = {theme = "auto"}
            })
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {},
    
    },

    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("nvim-tree").setup()
        end,
    },

}
