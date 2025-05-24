return {
-- Install with Lazy.nvim
    {
      "akinsho/bufferline.nvim",
      version = "*",
      dependencies = "nvim-tree/nvim-web-devicons",
      config = function()
        require("bufferline").setup({
          options = {
            mode = "tabs", -- Force tab-like display
            separator_style = "slant", -- Stylish separators
            show_close_icon = false,
            always_show_bufferline = true,
          },
        })
      end,
    }
}
