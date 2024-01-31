local utils = require "core.utils"
local path_join = utils.path_join
local config = vim.fn.stdpath "config"

-- default global value
vim.g.python = "python3"
vim.g.transparent = false
vim.g.following_system = false
_G.lsp_servers = {}

-- Get path of custom file
local custom_path = path_join(config, "lua", "custom.lua")
local template_path = path_join(config, "template", "custom_default.lua")

-- Command for open custom file
vim.api.nvim_create_user_command("CustomOpen", function()
  vim.cmd ("e " .. custom_path)
end, {
  desc = "Open custom file",
})

-- Load custom file
if vim.loop.fs_stat(custom_path) then
  require "custom"
  return true
end

-- Create and open custom.lua
utils.copy_file(template_path, custom_path)
vim.cmd "colorscheme habamax"
vim.cmd("e " .. custom_path)

return false
