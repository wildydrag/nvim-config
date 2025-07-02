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
    -- Set your default provider to 'ollama'
    provider = "ollama",

    providers = {
      -- Keep your openai config if you still want to use it
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

      -- Add the Ollama provider configuration
      ollama = {
        -- Set the endpoint to your Ollama server's IP and port
        -- Ollama's API is typically at /api, but avante.nvim seems to expect
        -- a base endpoint like 'http://IP:PORT'
        endpoint = "http://192.168.0.157:11434",
        -- Specify the model name you created in Ollama
        model = "deepseek-coder-33b",
        -- You can add extra_request_body options if needed,
        -- though Ollama handles many internally.
        -- For example, to adjust temperature:
        extra_request_body = {
          temperature = 0.5, -- Adjust for more or less creative responses
          -- num_ctx = 4096, -- Example: Adjust context window if model supports it
          -- num_gpu_layers = 0, -- Example: Force CPU inference if needed for testing (0 layers on GPU)
          -- You might need to experiment with max_tokens for Ollama,
          -- as it can be sensitive to the model's max context.
          -- max_tokens = 2048,
        },
        -- Avante.nvim might have specific requirements for parsing Ollama responses.
        -- The example in avante.nvim's issue tracker suggests custom parse_response_data
        -- and parse_curl_args functions for full compatibility.
        -- If you encounter issues (e.g., incorrect diffs, no context), you might need to
        -- add these more advanced parsing functions.
        -- For now, let's start simple, as Avante's Ollama support has improved.
        -- If needed, refer to Avante's GitHub discussions/wiki for advanced Ollama config.
        -- parse_response_data = function(data_stream, event_state, opts)
        --   -- This is complex and might be needed for full feature support (e.g., diffs)
        --   -- Refer to avante.nvim's source or issues for the correct implementation
        --   require('avante.providers').copilot.parse_response(data_stream, event_state, opts)
        -- end,
        -- parse_curl_args = function(opts, code_opts)
        --   -- This is also complex, for customizing the API request to Ollama
        --   -- Refer to avante.nvim's source or issues for the correct implementation
        --   return {
        --     url = opts.endpoint .. '/chat/completions', -- Ollama's chat endpoint
        --     headers = {
        --       ['Accept'] = 'application/json',
        --       ['Content-Type'] = 'application/json',
        --     },
        --     body = {
        --       model = opts.model,
        --       messages = require('avante.providers').copilot.parse_messages(code_opts),
        --       max_tokens = 2048, -- Example max_tokens, adjust as needed
        --       stream = true,
        --     },
        --   }
        -- end,
      },
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
