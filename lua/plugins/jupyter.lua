-- return {
--     {
--     'goerz/jupytext.nvim',
--     version = '0.2.0',
--     opts = {},  -- see Options
--     }
-- }

return {
  "GCBallesteros/jupytext.nvim",
  config = true,
  -- Depending on your nvim distro or config you may need to make the loading not lazy
  -- lazy=false,
}
-- Lua
-- return {
--   "ahmedkhalf/jupyter-nvim",
--   run = ":UpdateRemotePlugins",
--   config = function()
--     require("jupyter-nvim").setup {
--       -- your configuration comes here
--       -- or leave it empty to use the default settings
--       -- refer to the configuration section below
--     }
--   end
-- }
