vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.mouse = 'a'
vim.opt.clipboard:append("unnamedplus") -- Use + register for all operations
vim.o.cursorline = true
-- vim.o.completeopt = 'menu,menuone,noinsert,noselect'
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Set overall transparency (0.0 = fully transparent, 1.0 = opaque)
vim.g.neovide_opacity = 0.8

-- -- Enable blur for the transparent background
-- vim.g.neovide_blur_amount_x = 10
-- vim.g.neovide_blur_amount_y = 10

-- Optional: smooth cursor
vim.g.neovide_cursor_vfx_mode = "railgun"
if vim.g.neovide then
  -- Disable Neovide's built-in completion (use nvim-cmp instead)
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_refresh_rate = 60
  -- Optional: Improve performance
  vim.g.neovide_no_pty = false
  vim.g.neovide_input_ime = false
  vim.g.neovide_scale_factor = 1.0 -- Default scale (100%)
  vim.g.neovide_cursor_animation_length = 0.1
-- Neovide-specific settings (optional)
  vim.g.neovide_remember_window_size = true
  vim.opt.guifont = "CaskaydiaCove Nerd Font:h12" -- Set your font
  -- Keybindings for font size
  vim.keymap.set({ "n", "i", "v" }, "<C-=>", function()
    local current_size = tonumber(vim.o.guifont:match(":h(%d+)")) or 12
    vim.o.guifont = vim.o.guifont:gsub(":h%d+", ":h" .. (current_size + 1))
  end, { desc = "Increase font size" })

  vim.keymap.set({ "n", "i", "v" }, "<C-->", function()
    local current_size = tonumber(vim.o.guifont:match(":h(%d+)")) or 12
    if current_size > 6 then -- Prevent font from becoming too small
      vim.o.guifont = vim.o.guifont:gsub(":h%d+", ":h" .. (current_size - 1))
    end
  end, { desc = "Decrease font size" })
  -- Smooth scaling with Ctrl+Mouse Wheel
  vim.keymap.set({ "n", "i", "v" }, "<C-ScrollWheelUp>", function()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1
  end)
  vim.keymap.set({ "n", "i", "v" }, "<C-ScrollWheelDown>", function()
    if vim.g.neovide_scale_factor >= 0.2 then -- Prevent scaling too small
      vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1
    end
  end)
  vim.keymap.set("n", "<leader>fs", function()
    vim.o.guifont = "CaskaydiaCove Nerd Font:h12" -- Reset to default
    vim.g.neovide_scale_factor = 1.0 -- Reset UI scale
  end, { desc = "Reset font size" })
end
vim.g.neovide_renderer = "femtovg"
