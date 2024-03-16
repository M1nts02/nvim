local dap = require "dap"

-- configurations
local configurations = {
  python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = vim.g.python,
      console = "integratedTerminal",
    },
  },
  cpp = {
    {
      name = "Launch",
      type = "lldb",
      request = "launch",
      program = function()
        return vim.fn.input "Path to executable: "
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      args = {},
      console = "integratedTerminal",
    },
  },
}

configurations.c = configurations.cpp
configurations.rust = configurations.cpp
configurations.zig = configurations.cpp

-- adapters
local adapters = {
  -- debugpy
  python = {
    type = "executable",
    command = vim.g.python,
    args = { "-m", "debugpy.adapter" },
  },
  -- lldb
  lldb = {
    type = "server",
    name = "lldb",
    port = "${port}",
    executable = {
      command = vim.fn.executable "codelldb" == 1 and "codelldb" or "lldb-vscode",
      args = { "--port", "${port}" },
    },
  },
}

-- Load adapters
for k, v in pairs(adapters) do
  dap.adapters[k] = v
end

-- Load configurations
for k, v in pairs(configurations) do
  dap.configurations[k] = v
end

-- Options
vim.fn.sign_define("DapBreakpoint", {
  text = "⊚",
  texthl = "LspDiagnosticsSignError",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("Dapstooped", {
  text = "❀",
  texthl = "LspDiagnosticsSignHint",
  linehl = "",
  numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "▷",
  texthl = "LspDiagnosticsSignInformation",
  linehl = "DiagnosticUnderlineInfo",
  numhl = "LspDiagnosticsSignInformation",
})

require("dap.ext.vscode").load_launchjs(nil, { lldb = { "cc", "cpp", "c", "rs", "zig" } })
