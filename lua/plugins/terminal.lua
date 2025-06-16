return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      local toggleterm = require("toggleterm")
      local Terminal = require("toggleterm.terminal").Terminal

      toggleterm.setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      })

      -- 🧭 Directional terminals
      vim.keymap.set("n", "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle Horizontal Terminal" })
      vim.keymap.set("n", "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>", { desc = "Toggle Vertical Terminal" })
      vim.keymap.set("n", "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>", { desc = "Toggle Floating Terminal" })
      vim.keymap.set("n", "<leader>tt", "<Cmd>ToggleTerm direction=tab<CR>", { desc = "Toggle Tab Terminal" })

      -- 🔢 Multiple numbered terminals (1-5)
      local terminals = {}
      for i = 1, 5 do
        terminals[i] = Terminal:new({ count = i, direction = "horizontal", hidden = true })
        vim.keymap.set("n", "<leader>t" .. i, function()
          terminals[i]:toggle()
        end, { desc = "Toggle Terminal " .. i })
      end

      -- 🐍 Python terminal
      local python = Terminal:new({ cmd = "python3", hidden = true, direction = "horizontal" })
      vim.keymap.set("n", "<leader>tp", function() python:toggle() end, { desc = "Toggle Python REPL" })

      -- 🧠 Node terminal
      local node = Terminal:new({ cmd = "node", hidden = true, direction = "vertical" })
      vim.keymap.set("n", "<leader>tn", function() node:toggle() end, { desc = "Toggle Node.js REPL" })

      -- 🧱 Lazygit
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
        float_opts = { border = "double" },
      })
      vim.keymap.set("n", "<leader>tg", function() lazygit:toggle() end, { desc = "Toggle Lazygit" })

      -- 🧼 Clean quitting and shortcuts
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function()
          vim.cmd("startinsert")
          vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { buffer = 0 })
          vim.keymap.set("n", "q", "<cmd>bd!<CR>", { buffer = 0 })
          vim.keymap.set("t", "qq", [[<C-\><C-n><cmd>bd!<CR>]], { buffer = 0 })
        end,
      })

      -- 🔼 Optional: Resize mappings (can be in your general config too)
      vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", { silent = true })
      vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", { silent = true })
      vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { silent = true })
      vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { silent = true })
    end,
  },
}
