return {
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = function()
        require("toggleterm").setup {
          direction = "horizontal",
          size = 15,
          open_mapping = [[<C-\>]],
          start_in_insert = true,
        }
      end
    }
}
