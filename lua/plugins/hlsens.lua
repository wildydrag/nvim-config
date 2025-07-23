return {
    'kevinhwang91/nvim-hlslens',
    event = 'BufRead', -- Load when a buffer is read
    config = function()
      require('hlslens').setup({
        -- You can customize hlslens here if needed
      })
    end
  }
