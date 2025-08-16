return {
  "folke/todo-comments.nvim",
    lazy=false,
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    -- your configuration comes here
  },
  keys = {
    { "<leader>fT", "<Cmd>TodoTelescope<CR>", desc = "open all todos, warnings, etc." },
  },
}
