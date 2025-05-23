vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.mouse = 'a'
vim.opt.clipboard:append("unnamedplus") -- Use + register for all operations
vim.o.cursorline = true
vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-- Set overall transparency (0.0 = fully transparent, 1.0 = opaque)
vim.g.neovide_opacity = 0.8

-- Enable blur for the transparent background
vim.g.neovide_blur_amount_x = 2.0
vim.g.neovide_blur_amount_y = 2.0

-- Optional: smooth cursor
vim.g.neovide_cursor_vfx_mode = "railgun"
