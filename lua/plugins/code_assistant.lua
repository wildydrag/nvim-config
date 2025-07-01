return {
  "yetone/avante.nvim",
  build = function()
    if vim.fn.has("win32") == 1 then
      return "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
    else
      return "make"
    end
  end,
  event = "VeryLazy",
  version = false,
-- Note: use environment variables in ~/.bashrc, ~/.zshrc, or .profile
-- export OPENAI_API_KEY="sk-..."
-- export GEMINI_API_KEY="..."
  opts = {
    provider = "openai", -- default provider (change to gemini if preferred)
    providers = {
      openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o", -- or "gpt-4-turbo", etc.
        headers = {
          Authorization = "Bearer " .. os.getenv("OPENAI_API_KEY"),
        },
        extra_request_body = {
          temperature = 0.7,
          max_tokens = 10000,
        },
      },
      -- gemini = {
      --   model = "gemini-2.0-flash", -- or "models/gemini-1.5-flash:streamGenerateContent"
      --   -- headers = {
      --   --   -- Gemini uses API key via query param, so you don't usually set Authorization header
      --   -- },
      --   -- query = {
      --   --   key = os.getenv("GEMINI_API_KEY"),
      --   -- },
      --   extra_request_body = {
      --     contents = {
      --       {
      --         parts = {
      --           { text = "__PROMPT__" }, -- __PROMPT__ will be replaced by Avante
      --         },
      --       },
      --     },
      --   },
      --   extract_answer = function(res)
      --     return res.candidates and res.candidates[1] and res.candidates[1].content.parts[1].text
      --   end,
      -- },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "echasnovski/mini.pick",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "ibhagwan/fzf-lua",
    "stevearc/dressing.nvim",
    "folke/snacks.nvim",
    "nvim-tree/nvim-web-devicons",
    "zbirenbaum/copilot.lua",
    {
      "HakonHarnes/img-clip.nvim",
      event = "VeryLazy",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      'MeanderingProgrammer/render-markdown.nvim',
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
}


