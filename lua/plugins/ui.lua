return {
         -- Example using LazyVim
    
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
