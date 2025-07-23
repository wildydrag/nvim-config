-- Inside your plugins table:
return {
  "voldikss/vim-browser-search",
 config = function()
    vim.keymap.set("v", "<leader>s", "<Plug>SearchVisual", { desc = "Search visually selected text in browser" })
    vim.keymap.set("n", "<leader>s", "<Plug>SearchNormal", { desc = "Search word under cursor in browser" })
  end,
  lazy = false,  -- or true, depending on when you want it loaded
}
