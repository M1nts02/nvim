-- Debug
return {
  -- DAP
  {
    "mfussenegger/nvim-dap",
    version = "*",
    cmd = {
      "DapContinue",
      "DapLoadLaunchJSON",
      "DapRestartFrame",
      "DapSetLogLevel",
      "DapShowLog",
      "DapStepInto",
      "DapStepOut",
      "DapStepOver",
      "DapTerminate",
      "DapToggleBreakpoint",
      "DapToggleRepl",
      "DapOpen",
      "DapClose",
    },
    config = function()
      require "plugins.debug.dap"
    end,
  },
  { -- DAP UI
    "rcarriga/nvim-dap-ui",
    version = "*",
    init = function()
      -- Open dapui
      vim.api.nvim_create_user_command("DapUIToggle", function()
        require("dapui").toggle()
      end, {desc = "Toggle dapui",
      })
    end,
    config = function()
      require "plugins.debug.dapui"
    end,
  },
  dependencies = { "mfussenegger/nvim-dap" },
}
