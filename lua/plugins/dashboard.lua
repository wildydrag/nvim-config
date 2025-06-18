return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
  local user = os.getenv("USER") or "User"
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          "                                                   ",
          "                                                   ",
          "                                                   ",
          "                                                   ",
          " ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
          " ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
          " ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
          " ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
          " ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
          " ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
          "                                                   ",
          "                                                   ",
          "   Welcome to Neovim, " ..user.." ✨",
          "                                                   ",
          "                                                   ",
        },

        center = {
          {
            icon = "  ",
            desc = "New File",
            key = "n",
            action = "enew",
          },
          {
            icon = "  ",
            desc = "Find File",
            key = "f",
            action = "Telescope find_files",
          },
          {
            icon = "  ",
            desc = "Recent Files",
            key = "r",
            action = "Telescope oldfiles",
          },
          {
            icon = "  ",
            desc = "Projects",
            key = "p",
            action = "Telescope projects",
          },
          {
            icon = "  ",
            desc = "Open Project Folder",
            key = "d",
            action = "lua require('myproject').pick_and_cd()",
          },
          {
            icon = "  ",
            desc = "Edit Config",
            key = "c",
            action = "e ~/.config/nvim/",
          },
          {
            icon = "  ",
            desc = "Quit Neovim",
            key = "q",
            action = "qa",
          },
        },

        footer = {
          "                                  ",
          "                                  ",
          "🚀 Sharif University of Technology",
          "🔧 Config powered by Lazy + Neovim",
          "💡 Tip: Stay consistent. Success comes daily.",
        },
      },
    })
  end,
}
