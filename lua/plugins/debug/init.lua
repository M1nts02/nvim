-- Debug
return {

  -- GDB for neovim
  {
    "sakhnik/nvim-gdb",
    cmd = {
      "GdbStart",
      "GdbStartBashDB",
      "GdbStartLLDB",
      "GdbStartPDB",
      "GdbStartRR",
    },
  },

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
