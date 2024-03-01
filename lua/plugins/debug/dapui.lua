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
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40,
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
vim.api.nvim_create_user_command("DapOpen", function()
  dapui.open()
end, {
  desc = "Open dapui",
})

-- Stop dap
vim.api.nvim_create_user_command("DapClose", function()
  vim.api.nvim_command "DapTerminate"
  dapui.close()
end, {
  desc = "Close dap and dapui",
})
