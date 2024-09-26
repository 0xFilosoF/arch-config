return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local ok, dapui, dap_vt, dap = pcall(function()
        return require "dapui", require "nvim-dap-virtual-text", require "dap"
      end)
      if not ok then
        return
      end

      dap_vt.setup()
      dapui.setup()

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ DAP Setup                                                │
      -- ╰──────────────────────────────────────────────────────────╯
      -- Automatically open UI
      dap.listeners.before.attach["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.launch["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Icons                                                    │
      -- ╰──────────────────────────────────────────────────────────╯
      vim.api.nvim_set_hl(0, "DapBreakpoint", { ctermbg = 0, fg = "#993939" })
      vim.api.nvim_set_hl(0, "DapLogPoint", { ctermbg = 0, fg = "#61afef" })
      vim.api.nvim_set_hl(0, "DapStopped", { ctermbg = 0, fg = "#98c379" })

      vim.fn.sign_define(
        "DapBreakpoint",
        { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapBreakpointCondition",
        { text = "ﳁ", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define(
        "DapBreakpointRejected",
        { text = "", texthl = "DapBreakpoint", linehl = "", numhl = "DapBreakpoint" }
      )
      vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "DapLogPoint" })
      vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "DapStopped" })

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Adapters                                                 │
      -- ╰──────────────────────────────────────────────────────────╯
      -- VSCODE JS (Node/Terminal)
      ---@diagnostic disable-next-line: missing-fields
      require("dap-vscode-js").setup {
        -- Not use Mason because => https://github.com/mxsdev/nvim-dap-vscode-js/issues/43
        -- debugger_path = vim.fn.stdpath "data" .. "/mason/packages/js-debug-adapter",
        debugger_path = vim.fn.stdpath "data" .. "/lazy/vscode-js-debug",
        adapters = { "pwa-node", "node-terminal" },
      }

      -- ╭──────────────────────────────────────────────────────────╮
      -- │ Configurations                                           │
      -- ╰──────────────────────────────────────────────────────────╯
      for _, language in ipairs { "typescript", "javascript" } do
        dap.configurations[language] = {
          {
            type = "pwa-node",
            request = "launch",
            name = "[node] Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            sourceMaps = true,
            protocol = "inspector",
            runtimeExecutable = "node",
            runtimeArgs = { "-r", "ts-node/register" },
            skipFiles = { "<node_internals>/**", "node_modules/**" },
            resolveSourceMapLocations = {
              "${workspaceFolder}/**",
              "!**/node_modules/**",
            },
          },
          {
            type = "pwa-node",
            request = "attach",
            name = "[node] Attach",
            processId = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
            skipFiles = { "<node_internals>/**" },
          },
        }
      end
    end,
    dependencies = {
      "mxsdev/nvim-dap-vscode-js",
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
      {
        "microsoft/vscode-js-debug",
        commit = "4d7c704d3f07",
        build = "npm i && npm run compile vsDebugServerBundle && mv dist out",
      },
    },
  },
}
