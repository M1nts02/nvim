local dap = require "dap"
local dapui = require "dapui"

-- auto open ui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end

require("dapui").setup {
  layouts = {
    {
      elements = {
        "scopes",
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 0.3,
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25,
      position = "bottom",
    },
  },
}

-- Open dapui
vim.api.nvim_create_user_command("DapUIToggle", function()
  dapui.toggle()
end, {
  desc = "Toggle dapui",
})

-- Stop dap
vim.api.nvim_create_user_command("DapUIClose", function()
  vim.api.nvim_command "DapTerminate"
  dapui.close()
end, {
  desc = "Close dap and dapui",
})
