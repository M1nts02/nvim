local M = {}
local utils = require "core.utils"
local path_join = utils.path_join

local cache_path = path_join(vim.fn.stdpath "cache", "toggle_theme.json")

local cache = {
  dark = true,
}

local create_or_change_cache = function()
  local cache_file = io.open(cache_path, "w")
  local context = vim.json.encode(cache)
  cache_file:write(context)
  cache_file:close()
end

local toggle_theme = function()
  if cache.dark then
    vim.cmd("colorscheme " .. vim.g.dark_theme)
  else
    vim.cmd("colorscheme " .. vim.g.light_theme)
  end
end

M.init = function()
  -- Read cache file
  local file = io.open(cache_path, "r")

  -- If file not exist, create cache file and set theme
  if not file then
    create_or_change_cache()
    toggle_theme()
  else
    -- If file exist, read cache file and set theme
    cache = vim.json.decode(file:read "*a")
    toggle_theme()
    file:close()
  end
end

M.get_dark_mode = function()
  return cache.dark
end

vim.api.nvim_create_user_command("ToggleTheme", function()
  local file = io.open(cache_path, "r")
  if file then
    cache = vim.json.decode(file:read "*a")
    cache.dark = not cache.dark
    file:close()
  end

  create_or_change_cache()
  toggle_theme()
end, {
  desc = "ToggleTheme",
})

return M
