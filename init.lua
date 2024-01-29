local os_name = jit.os
vim.g.is_mac = os_name:find "OSX" ~= nil
vim.g.is_linux = os_name:find "Linux" ~= nil
vim.g.is_windows = os_name:find "Windows" ~= nil

local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
local confpath = vim.fn.stdpath "config"

-- Load custom.lua
local result = require "core.load_custom"

if not result then
  return
end

-- Load options
require "core.options"

-- Don't load shada
local shada = vim.o.shada
vim.o.shada = ""

-- Check plugin manager
if not vim.loop.fs_stat(lazypath) then
  print "Downloading ..."
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  }
end

-- Load lazy.nvim
vim.opt.runtimepath:prepend(lazypath)

require("lazy").setup({

  -- Plugins manager
  { "folke/lazy.nvim", version = "*" },

  -- Load plugins
  { import = "plugins" },

  -- Lazy-load
  {
    name = "lazy-load",
    dir = confpath,
    event = "VeryLazy",
    config = function()
      -- Load shada
      vim.o.shada = shada
      pcall(vim.cmd.rshada, { bang = true })
      -- Load mapping
      require "core.mapping"
    end,
  },

  -- Large file
  {
    name = "large-file",
    dir = confpath,
    event = "BufReadPre",
    config = function()
      local filesize = vim.fn.getfsize(vim.fn.expand "%")
      if filesize > 50000000 then
        vim.o.syntax = false
        vim.o.number = false
        vim.o.relativenumber = false
      end
    end,
  },
}, {
  ui = {
    border = "rounded",
  },
})
