
local M = {}
-- toggle transparency and blur
local is_transparent = true

function M.ToggleTransparency()
  if is_transparent then
    vim.g.neovide_opacity = 1.0
    vim.g.neovide_blur_amount_x = 0
    vim.g.neovide_blur_amount_y = 0
    is_transparent = false
  else
    vim.g.neovide_opacity = 0.8
    vim.g.neovide_blur_amount_x = 100
    vim.g.neovide_blur_amount_y = 100
    is_transparent = true
  end
end


vim.api.nvim_create_user_command("ToggleTransparencyNeo", M.ToggleTransparency, {})
return M
