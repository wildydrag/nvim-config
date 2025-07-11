return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  config = function()
    require("lsp_signature").setup({
      bind = true, -- This is mandatory, otherwise border config won't get registered
      handler_opts = {
        border = "rounded",
      },
      -- floating_window_off_y = 1,  -- Move down by 1 line (adjust as needed)
      -- floating_window_off_x = 1,
      move_signature_window_key = {'<M-k>', '<M-j>', '<M-h>', '<M-l>'},
      hint_enable = false, -- Disable inline hint as it can be annoying
      hint_prefix = "🐼 ",
      toggle_key_flip_floatwin_setting = true,
      extra_trigger_chars = {"="},  -- Force update when typing = for kwargs
      toggle_key = "<C-k>", -- Toggle signature help with Ctrl-k
      move_cursor_key = "<M-p>",-- imap, use nvim_set_current_win to move cursor between current win and floating window
  -- e.g. move_cursor_key = '<M-p>',
  -- once moved to floating window, you can use <M-d>, <M-u> to move cursor up and down
      select_signature_key = "<M-n>", -- Cycle through signatures with Alt-n
    })
  end,
}
