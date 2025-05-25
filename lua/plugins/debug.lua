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

    vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#FFA500" })
    vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#FFD700" })  -- Gold

      local dapui = require("dapui")

      dapui.setup()
      require("nvim-dap-virtual-text").setup()

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
