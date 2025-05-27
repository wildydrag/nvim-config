return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {"nvim-lua/plenary.nvim"},
        cmd = "Telescope",
        config = function()
            require('telescope').setup({
              extensions = {},
              defaults = {
                preview = {
                  -- this avoids actual checkout, shows diffs in a floating window
                  use_delta = true,
                },
              },
            })
        end,
    },
}
