return {
  {
    "CRAG666/code_runner.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
    require("code_runner").setup({
      mode = "toggleterm",  -- or "float" for a floating window
      filetype = {
        python = "python3 -u",
        javascript = "node",
        typescript = "deno run",
        rust = "cargo run",
        sh = "bash",
        go = "go run",
        java = "javac $fileName && java $fileNameWithoutExt",
        c = "gcc $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
        cpp = "g++ $fileName -o $fileNameWithoutExt && ./$fileNameWithoutExt",
      },
    })
    vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
    end,
  }
}
