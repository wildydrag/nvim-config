return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    require("lspsaga").setup({
      ui = {
        border = "rounded",
        winblend = 10,
      },
    })
    -- mappings
    vim.keymap.set("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", { desc = "Lspsaga Hover Doc" })
    vim.keymap.set("n", "gs", "<cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>", { desc = "Lspsaga Signature Help" })
    -- insert‑mode mapping
    vim.keymap.set("i", "<C-s>", function()
      require("lspsaga.signaturehelp").signature_help()
    end, { desc = "Lspsaga Signature Help" })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  }
}
