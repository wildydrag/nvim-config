return {
    {
    'dstein64/nvim-scrollview',
    config = function()
      require('scrollview').setup({
        -- **Basic Scrollbar Configuration**
        always_show = false, -- Whether scrollbars and signs are shown when all lines are visible. Defaults to false.
        base = 'right',      -- Where the scrollbar is anchored: 'left', 'right', or 'buffer'. Defaults to 'right'.
        column = 1,          -- The scrollbar column (relative to 'base'). Defaults to 1.
        character = '',      -- A character to display on scrollbars (e.g., '█', '░'). Defaults to ''.
        winblend = 50,       -- Transparency level for the scrollbar (0-100). Defaults to 50.
                             -- Set to 0 for no transparency (solid color).

        -- **Sign Configuration (This is where Git, Marks, Search, etc., come in)**
        signs = {
          -- By default: diagnostics = true, search = true, marks = true (for nvim >= 0.10)
          -- You explicitly set these to override defaults or enable others.

          diagnostics = true,  -- Show LSP diagnostics (errors, warnings, info)
          search = true,       -- Show search results (requires hlsearch enabled in Neovim)
          marks = true,        -- Show marks (e.g., 'a, 'b). Requires nvim >= 0.10

          -- To enable Git signs:
          git = true,          -- Show Git hunks (added, modified, removed).
                               -- This *requires* a separate Git plugin like `lewis6991/gitsigns.nvim`.

          -- Other built-in sign groups you might want to enable:
          folds = true,        -- Show folded regions
          changelist = false,  -- Show changelist items (:help changelist)
          latestchange = false, -- Show the location of the most recent edit
          keywords = false,    -- Show signs for keywords (e.g., TODO, WARN). Can be configured further.
          indent = false,      -- Shows signs for unexpected indentation characters (e.g., tabs when expandtab is set)
          quickfix = false,    -- Shows signs for items in the quickfix/location list
          location = false,    -- Alias for quickfix
          jump = false,        -- Shows signs for jump list items
          treesitter = false,  -- Shows signs related to Treesitter (e.g., text objects)
          cursor = false,      -- Shows a sign for the cursor position (usually not needed with a scrollbar)
          -- ... and potentially others, check the `:help scrollview-signs`
        },

        -- **Customizing Sign Display (Optional)**
        -- You can customize the symbols and highlight groups for each sign type.
        -- For example, to change the symbol for git additions:
        -- sign_config = {
        --   git = {
        --     add = { text = '➕', hl = 'GitSignsAdd' },
        --     change = { text = '〰️', hl = 'GitSignsChange' },
        --     delete = { text = '➖', hl = 'GitSignsDelete' },
        --   },
        --   diagnostics = {
        --     ERROR = { text = '!', hl = 'DiagnosticError' },
        --     WARN = { text = '?', hl = 'DiagnosticWarn' },
        --   },
        -- },

        -- **Other useful options:**
        current_only = false, -- Only display scrollbars and signs in the current window. Defaults to false.
                              -- Set to `true` if you only want it in the active window.
        excluded_filetypes = { 'NvimTree', 'vista', 'dapui_stacks' }, -- List of filetypes where scrollbars should not be displayed.
        auto_mouse = true,    -- Automatically create a mapping for mouse support (dragging scrollbar, clicking signs). Defaults to true.
        auto_workarounds = true, -- Apply workarounds for known issues. Defaults to true.

        -- You can also configure a global variable `vim.g.scrollview_signs_on_startup`
        -- directly if you prefer not to use the `signs` table within `setup`.
        -- For example:
        -- vim.g.scrollview_signs_on_startup = { 'diagnostics', 'search', 'git', 'marks' }
      })
    end,
    -- Make sure it loads on startup, not lazily
    lazy = false,
  },

  -- **Important: You need to install a Git plugin for Git signs to work!**
  -- `lewis6991/gitsigns.nvim` is highly recommended and widely used.
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup({
        -- Options for gitsigns.nvim itself (e.g., numhl, linehl, word_diff)
      })
    end
  },

  -- **For better search result highlighting (optional but recommended for 'search' signs)**
  {
    'kevinhwang91/nvim-hlslens',
    event = 'BufRead', -- Load when a buffer is read
    config = function()
      require('hlslens').setup({
        -- You can customize hlslens here if needed
      })
    end
  },

  -- For marks, no extra plugin is typically needed if you're on Neovim >= 0.10.
  -- Neovim has built-in mark functionality.
}
