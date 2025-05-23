local M = {}

-- Toggle transparency for Normal and Floating windows
function M.toggle_transparency()
  local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
  if normal_hl.bg then
    -- Enable transparency
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.notify("Transparency: ON", vim.log.levels.INFO)
  else
    -- Disable transparency (set a solid background)
    vim.api.nvim_set_hl(0, "Normal", { bg = "#1a1b26" })  -- Replace with your theme's default BG
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#1a1b26" })
    vim.notify("Transparency: OFF", vim.log.levels.INFO)
  end
end

-- Register the command
vim.api.nvim_create_user_command("ToggleTransparency", M.toggle_transparency, {})

return M
