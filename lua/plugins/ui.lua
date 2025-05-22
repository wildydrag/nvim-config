return {
    {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("tokyonight")
    end,
    },
    {"catppuccin/nvim", name = "catppuccin"},
    {"ellisonleao/gruvbox.nvim"},
    { "rose-pine/neovim", name = "rose-pine" },
    
    {
        "nvim-tree/nvim-web-devicons",
        opts = {}

    },

    {
        "nvim-lualine/lualine.nvim",
        dependencies = {"nvim-tree/nvim-web-devicons"},
        config = function()
            require("lualine").setup({
                options = {theme = "tokyonight"}
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
