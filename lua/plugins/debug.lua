return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio"
    },
    config = function()
      local dap = require("dap")

    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#FFA500" })

    vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpointCondition", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "DapStoppedNum" })

  -- Highlight groups
    vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#FFA500" })  -- Orange
    vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#FFA500" })  -- Orange
    vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#FFD700" })  -- Gold
    vim.api.nvim_set_hl(0, "DapStopped", { fg = "#00FF00", bold = true })  -- Bright green
    vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#3a3a3a" })  -- Dark gray background for the line
    vim.api.nvim_set_hl(0, "DapStoppedNum", { fg = "#00FF00", bg = "#3a3a3a" })  -- Green for line number


      local dapui = require("dapui")

      dapui.setup()
      -- Cleaner virtual text
      require("nvim-dap-virtual-text").setup({
        enabled = true,
        highlight_changed_variables = true,
        highlight_new_as_changed = true,
        commented = false,
        only_first_definition = true,  -- Only show vars where they're first defined
        all_references = false,       -- Don't show all references
        virt_text_pos = "eol",        -- Show at end of line (cleaner)
        display_callback = function(variable, _buf, _stackframe, _node)
          -- Skip internal/underscore vars
          if variable.name:sub(1, 1) == "_" then
            return nil
          end
          -- Trim long values
          local value = variable.value
          if type(value) == "string" and #value > 30 then
            value = value:sub(1, 30) .. "..."
          end
          return variable.name .. " = " .. value
        end,
      })

      -- 🐍 Python (debugpy)
      dap.adapters.python = {
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      }

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Launch File",
        program = "${file}",
        pythonPath = function()
          return "python"
        end,
        args = {},  -- This can be empty if you want to specify args when launching
      },
      {
        type = "python",
        request = "launch",
        name = "Launch File with Args",
        program = "${file}",
        pythonPath = function()
          return "python"
        end,
        args = function()
          local args_string = vim.fn.input('Program arguments: ')
          return vim.split(args_string, ' ')
        end,
        console = "integratedTerminal",
      },
      {
        type = "python",
        request = "launch",
        name = "Debug Pytest Current File",
        module = "pytest",
        args = { "${file}" },
        justMyCode = true,
        console = "integratedTerminal",
        pythonPath = function()
          return "python"
        end,
      },
      {
        type = "python",
        request = "launch",
        name = "CrouseLD",
        program = "${file}",
        justMyCode = true,
        console = "integratedTerminal",
        pythonPath = function()
          return "python"
        end,
        cwd = "/home/emad-changizi/personal/crouse/crouseLD"
      },
      -- Add your specific configuration for the training command
      {
        type = "python",
        request = "launch",
        name = "Train LaneAtt",
        program = "${file}",
        args = {
          "train",
          "--exp_name", "laneatt_r34_vil100_9",
          "--cfg", "cfgs/temporal_vil100_resnet34.yml"
        },
        pythonPath = function()
          return "python"
        end,
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        justMyCode = true,
      }
    }

      -- ⚙️ C/C++ (LLDB)
      dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode",
        name = "lldb"
      }

      local function build_and_debug()
        local filename = vim.fn.expand("%:t:r")
        local filepath = vim.fn.expand("%:p:h")
        local fullpath = filepath .. "/" .. filename
        local output = filepath .. "/" .. filename .. ".out"

        local compile_cmd = "g++ -g '" .. fullpath .. ".cpp' -o '" .. output .. "'"
        vim.cmd("write")  -- Save current file
        local result = os.execute(compile_cmd)

        if result == 0 then
          dap.run({
            name = "Auto Build & Debug",
            type = "lldb",
            request = "launch",
            program = output,
            cwd = filepath,
            stopOnEntry = false,
            args = {},
          })
        else
          vim.notify("Compilation failed", vim.log.levels.ERROR)
        end
      end

      dap.configurations.cpp = {
        {
          name = "Launch C++ file",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = {},
        },
        {
          name = "Auto Build & Debug",
          type = "lldb",
          request = "launch",
          program = "${fileDirname}/${fileBasenameNoExtension}.out",
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
          args = {},
        },
      }

      dap.configurations.c = dap.configurations.cpp

      -- UI behavior
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- 🔑 Keybindings
      vim.keymap.set("n", "<F5>", dap.continue, { desc = "Start/Continue Debugging" })
      vim.keymap.set("n", "<F6>", dap.step_over, { desc = "Step Over" })
      vim.keymap.set("n", "<F7>", dap.step_into, { desc = "Step Into" })
      vim.keymap.set("n", "<F8>", dap.step_out, { desc = "Step Out" })
      vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })

      vim.keymap.set("n", "<Leader>dp", function()
        require("dap").run(require("dap").configurations.python[2])
      end, { desc = "Debug Pytest Current File" })

      vim.keymap.set("n", "<Leader>dt", function()
        require("nvim-dap-virtual-text").toggle()
      end, { desc = "Toggle Virtual Text" })

      vim.keymap.set("n", "<Leader>B", function()
        dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
      end, { desc = "Set Conditional Breakpoint" })
      vim.keymap.set("n", "<Leader>lp", function()
        dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
      end, { desc = "Set Log Point" })
      vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "Open REPL" })
      vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "Run Last Debugging Session" })

      -- 🚀 Auto build & debug with <F9>
      vim.keymap.set("n", "<F9>", build_and_debug, { desc = "Auto Compile and Debug C++" })
    end
  }
}
