vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer"})
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files"})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Info" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>f", ":NvimTreeFocus<CR>" , {desc = "Focus File Tree"})
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", {desc = "Find Current File in Tree"})
vim.keymap.set("i", "<C-H>", "<C-W>", { desc = "Delete word backward" })
vim.keymap.set({'n', 'i', 'v', 'c'}, '<Esc><Esc>', '<Esc>:w<CR>', { noremap = true })
-- Keymaps for system clipboard
vim.keymap.set({'n', 'v'}, '<leader>y', '"+y', {desc = "Yank to system clipboard"})
vim.keymap.set({'n', 'v'}, '<leader>p', '"+p', {desc = "Paste from system clipboard"})
vim.keymap.set({'n', 'v'}, '<leader>P', '"+P', {desc = "Paste from system clipboard (before)"})
vim.keymap.set('n', '<leader>do', ':DiffviewOpen<CR>', { desc = "Open Diffview" })
vim.keymap.set('n', '<leader>dc', ':DiffviewClose<CR>', { desc = "Close Diffview" })
vim.keymap.set('n', '<leader>dh', ':DiffviewFileHistory<CR>', { desc = "File History" })
vim.keymap.set('n', '<leader>r', ':RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set("n", "<Leader>tt", "<cmd>ToggleTransparency<CR>", { desc = "Toggle Transparency" })

local themes = { "tokyonight", "catppuccin", "gruvbox", "rose-pine", "nord", "nordic" }
local current = 1

vim.api.nvim_create_user_command("ThemeToggle", function()
  current = (current % #themes) + 1
  vim.cmd("colorscheme " .. themes[current])
  vim.notify("Switched to " .. themes[current])
end, {})
-- Map <leader>t to toggle themes
vim.keymap.set("n", "<leader>t", "<cmd>ThemeToggle<CR>", { desc = "Toggle Theme" })

