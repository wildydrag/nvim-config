vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer"})
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files"})
vim.keymap.set("n", "<leader>bj", "<cmd>Telescope jumplist<CR>", { desc = "Show jumplist (Telescope)" })
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
vim.keymap.set("i", "<C-BS>", "<C-W>", { noremap = true, silent = true, desc = "Delete word backward" })
vim.keymap.set("n", "<Leader>tt", "<cmd>ToggleTransparency<CR>", { desc = "Toggle Transparency" })
vim.keymap.set("n", "<Leader>tb", "<cmd>ToggleBlur<CR>", { desc = "Toggle Transparency" })
vim.keymap.set("n", "<leader>mm", "<cmd>ToggleTransparencyNeo<CR>", {desc = "Toggle Transparency"})

-- Use <Tab> and <S-Tab> to navigate popup menu
vim.keymap.set("i", "<Tab>", function()
  if vim.fn.pumvisible() == 1 then
    return vim.api.nvim_replace_termcodes("<C-n>", true, true, true)
  else
    return "\t"
  end
end, { expr = true, noremap = true })

vim.keymap.set("i", "<S-Tab>", function()
  return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true, noremap = true })

-- Use <CR> to confirm selection
vim.keymap.set("i", "<CR>", function()
  return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true, noremap = true })


local themes = { "tokyonight", "catppuccin", "gruvbox", "rose-pine", "nord", "nordic" }
local current = 1

vim.api.nvim_create_user_command("ThemeToggle", function()
  current = (current % #themes) + 1
  vim.cmd("colorscheme " .. themes[current])
  vim.notify("Switched to " .. themes[current])
end, {})
-- Map <leader>t to toggle themes
vim.keymap.set("n", "<leader>t", "<cmd>ThemeToggle<CR>", { desc = "Toggle Theme" })

vim.keymap.set({ "i", "n" }, "<C-s>", function()
  require("lsp_signature").toggle_float_win()
end, { silent = true, desc = "Toggle signature help" })

vim.keymap.set("i", "<C-n>", function()
  require("lsp_signature").signature({ move_cursor_key = "<C-n>" })
end, { silent = true, desc = "Cycle through overloads" })
