local M = {}
-- Toggle blur (only works in Neovide)
M.is_blur_enabled = false
function M.toggle_blur()
  if vim.g.neovide then
    M.is_blur_enabled = not M.is_blur_enabled
    if M.is_blur_enabled then
      vim.g.neovide_blur_amount_x = 2.0
      vim.g.neovide_blur_amount_y = 2.0
      vim.notify("Blur: ON", vim.log.levels.INFO)
    else
      vim.g.neovide_blur_amount_x = 0.0
      vim.g.neovide_blur_amount_y = 0.0
      vim.notify("Blur: OFF", vim.log.levels.INFO)
    end
  else
    vim.notify("Blur toggle only works in Neovide", vim.log.levels.WARN)
  end
end

-- Register commands
vim.api.nvim_create_user_command("ToggleBlur", M.toggle_blur, {})

return M
