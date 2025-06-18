local M = {}

function M.pick_and_cd()
  local projects = require("project_nvim").get_recent_projects()

  vim.ui.select(projects, {
    prompt = "Select a project to open (cd into)",
    format_item = function(item)
      return "📁  " .. item
    end,
  }, function(choice)
    if choice then
      vim.cmd("cd " .. vim.fn.fnameescape(choice))
      vim.cmd("e .") -- Open file explorer in new cwd
    end
  end)
end

return M
