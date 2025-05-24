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
        require("nvim-tree").setup({
          view = {
            width = 30,
          },
          actions = {
            open_file = {
              quit_on_open = false,
              window_picker = {
                enable = true,
              },
            },
          },
        })

        -- Working Ctrl+LeftClick implementation
        vim.api.nvim_create_autocmd('FileType', {
          pattern = 'NvimTree',
          callback = function(args)
            local api = require('nvim-tree.api')
            vim.keymap.set('n', '<C-LeftMouse>', function()
              local node = api.tree.get_node_under_cursor()
              if node and node.absolute_path then
                api.node.open.tab(node)
              end
            end, { buffer = args.buf, desc = 'Open in new tab' })
          end
        })

        -- Toggle keymap
        vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', {desc = 'Toggle file explorer'})
      end,
    }

}
