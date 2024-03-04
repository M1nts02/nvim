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
    dependencies = {
      { -- DAP UI
        "rcarriga/nvim-dap-ui",
        version = "*",
        config = function()
          require "plugins.debug.dapui"
        end,
      },
    },
  },
}
