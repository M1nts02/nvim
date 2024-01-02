-- Load custom.lua
local result = require "core.load_custom"

if not result then
  return
end

require "core.options"
require "core.bootstrap"

-- Lazy-load
vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    require("core.toggle_theme").init()
    require "core.mapping"
  end,
})

-- Large file
vim.api.nvim_create_autocmd("BufReadPre", {
  callback = function()
      local filesize = vim.fn.getfsize(vim.fn.expand "%")
    if filesize > 50000000 then
      vim.o.syntax = false
      vim.o.number = false
      vim.o.relativenumber = false
    end
  end,
})
