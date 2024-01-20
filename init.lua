local os_name = jit.os
vim.g.is_mac = os_name:find "OSX" ~= nil
vim.g.is_linux = os_name:find "Linux" ~= nil
vim.g.is_windows = os_name:find "Windows" ~= nil

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
