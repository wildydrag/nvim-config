vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer"})
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Info" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "<leader>nf", ":NvimTreeFocus<CR>" , {desc = "Focus File Tree"})
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", {desc = "Find Current File in Tree"})
vim.keymap.set("i", "<C-H>", "<C-W>", { desc = "Delete word backward" })
vim.keymap.set({'n'}, '<BS><BS>', '<Esc>:w<CR>', { noremap = true, desc = "save the file"})

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
vim.keymap.set("n", "<Leader>kk", "<cmd>ToggleTransparency<CR>", { desc = "Toggle Transparency" })
vim.keymap.set("n", "<leader>bb", "<cmd>ToggleBlur<CR>", { desc = "Toggle Transparency" })
vim.keymap.set("n", "<leader>mm", "<cmd>ToggleTransparencyNeo<CR>", {desc = "Toggle Transparency"})

vim.keymap.set('n', '<Esc>', function()
  if vim.v.hlsearch == 1 then
    vim.cmd.nohlsearch()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
  end
end, { desc = 'Smart Esc: clear highlights or normal Esc' })


------------------------------------ Telescope ---------------------------------------
local telescope = require('telescope.builtin')
vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Find Files"})
vim.keymap.set("n", "<leader>fj",telescope.jumplist, { desc = "Show jumplist (Telescope)" })
vim.keymap.set("n", "<leader>fl", telescope.live_grep, {desc = "Telescope live grep"})
vim.keymap.set('n', '<leader>fb', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fs', telescope.grep_string, { desc = 'Telescope: Search Strings' })
vim.keymap.set('n', '<leader>fo', telescope.oldfiles, { desc = 'Telescope: List previously open files' })
vim.keymap.set('n', '<leader>ft', telescope.treesitter, { desc = 'Telescope: Lists Function names, variables, from Treesitter!' })
vim.keymap.set('n', '<leader>fc', telescope.colorscheme, {desc = 'Telescope: available color schemes'})
vim.keymap.set('n', '<leader>fg', telescope.git_commits, { desc = 'Telescope: Git commits' })
vim.keymap.set('n', '<leader>fgc', telescope.git_bcommits, { desc = 'Telescope: Git commits for current file' })
vim.keymap.set('n', '<leader>fgb', telescope.git_branches, { desc = 'Telescope: List all branches with log preview' })
--------------------------------------------------------------------------------------


------------------------------------ dap ---------------------------------------

--------------------------------------------------------------------------------------

vim.keymap.set("n", "<leader>ht", "<cmd>ToggleHover<CR>", { desc = "Toggle Hover DAP" })
vim.keymap.set("n", "<RightMouse>",  "<cmd>ToggleHover<CR>", { desc = "Toggle Hover DAP with mouse" })


local themes = { "tokyonight", "catppuccin", "gruvbox", "rose-pine", "nord", "nordic" }
local current = 1

vim.api.nvim_create_user_command("ThemeToggle", function()
  current = (current % #themes) + 1
  vim.cmd("colorscheme " .. themes[current])
  vim.notify("Switched to " .. themes[current])
end, {})
-- Map <leader>t to toggle themes
vim.keymap.set("n", "<leader>t", "<cmd>ThemeToggle<CR>", { desc = "Toggle Theme" })


-- Movement between splits
vim.keymap.set("n", "<leader>wh", "<C-w>h", { noremap = true, silent = true, desc = "Go Left" })
vim.keymap.set("n", "<leader>wj", "<C-w>j", { noremap = true, silent = true , desc = "Go Down" })
vim.keymap.set("n", "<leader>wk", "<C-w>k", { noremap = true, silent = true , desc = "Go Up"})
vim.keymap.set("n", "<leader>wl", "<C-w>l", { noremap = true, silent = true, desc = "Go Right"})
vim.keymap.set("n", "<leader>ww", "<C-w>w", { noremap = true, silent = true, desc = "Next Window" })

-- Splitting
vim.keymap.set("n", "<leader>wv", "<C-w>v", { noremap = true, silent = true, desc = "Split Vertical"})
vim.keymap.set("n", "<leader>ws", "<C-w>s", { noremap = true, silent = true, desc = "Split Window"})
vim.keymap.set("n", "<leader>wT", "<C-w>T", { noremap = true, silent = true, desc = "Break out into a new tab"})

-- Resize
vim.keymap.set("n", "<leader>w+", "<C-w>+", { noremap = true, silent = true, desc = "Increase height" })
vim.keymap.set("n", "<leader>w-", "<C-w>-", { noremap = true, silent = true, desc = "Decrease height" })
vim.keymap.set("n", "<leader>w<", "<C-w><", { noremap = true, silent = true, desc = "Decrease width" })
vim.keymap.set("n", "<leader>w>", "<C-w>>", { noremap = true, silent = true, desc = "Increase width" })

-- Window commands
vim.keymap.set("n", "<leader>wq", "<C-w>q", { noremap = true, silent = true, desc = "Quit a window" })
vim.keymap.set("n", "<leader>wo", "<C-w>o", { noremap = true, silent = true, desc = "Close all other windows" })
vim.keymap.set("n", "<leader>wx", "<C-w>x", { noremap = true, silent = true, desc = "Swap current with next"})
vim.keymap.set("n", "<leader>w=", "<C-w>=", { noremap = true, silent = true, desc = "Equal height and width"})
vim.keymap.set("n", "<leader>w_", "<C-w>_", { noremap = true, silent = true, desc = "Max out the height"})
vim.keymap.set("n", "<leader>w|", "<C-w>|", { noremap = true, silent = true, desc = "Max out the width"})

-- Move window
vim.keymap.set("n", "<leader>wH", "<C-w>H", { noremap = true, silent = true, desc = "Move window to far right"})
vim.keymap.set("n", "<leader>wJ", "<C-w>J", { noremap = true, silent = true, desc = "Move window to far down"})
vim.keymap.set("n", "<leader>wK", "<C-w>K", { noremap = true, silent = true, desc = "Move window to far top"})
vim.keymap.set("n", "<leader>wL", "<C-w>L", { noremap = true, silent = true, desc = "Move window to far left"})


