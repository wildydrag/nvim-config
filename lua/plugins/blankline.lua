return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  config = function(_, opts)
    local ibl = require("ibl")
    ibl.setup(opts)

    -- Disable ibl for dashboard buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "dashboard",
      callback = function()
        vim.schedule(function()
          -- This disables ibl only for the current buffer (Dashboard)
          ibl.setup_buffer(0, { enabled = false })
        end)
      end,
    })
  end,
}
