return {
    {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    config = function()
        require("lsp_signature").setup({
          bind = true, -- Automatically bind to signature help
          handler_opts = {
            border = "rounded", -- Border style: "none", "single", "double", "rounded", "solid", "shadow"
          },
          hint_enable = false, -- Disable inline hints (avoids conflicts with Neovide)
          hi_parameter = "LspSignatureActiveParameter", -- Highlight matching parameter
          floating_window = true, -- Show signature in a floating window
          floating_window_above_cur_line = true, -- Position above current line
          toggle_key = "<C-s>", -- Toggle signature help (useful for manual trigger)
          select_signature_key = "<C-n>", -- Cycle through overloads (if available)
          max_height = 12, -- Max height of floating window
          max_width = 80, -- Max width of floating window
          padding = "", -- Padding around signature
          zindex = 200, -- Floating window z-index
          transparency = nil, -- Disable transparency (set to 10-90 if desired)
          -- Extra triggers (optional)
          extra_trigger_chars = { "(", "," }, -- Auto-trigger on these chars
          -- Debugging (if needed)
          debug = false,
          log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",
    })
    end,
    }
}
