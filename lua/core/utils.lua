local M = {}

local os_name = jit.os
M.is_mac = os_name:find "OSX" ~= nil
M.is_linux = os_name:find "Linux" ~= nil
M.is_windows = os_name:find "Windows" ~= nil

-- connect path
M.path_join = function(...)
  local sep = M.is_windows and "\\" or "/"
  return table.concat({ ... }, sep)
end

-- connect tables
M.merge_tables = function(...)
  local tabs = { ... }
  if not tabs then
    return {}
  end
  local origin = tabs[1]
  for i = 2, #tabs do
    if origin then
      if tabs[i] then
        for _, v in pairs(tabs[i]) do
          table.insert(origin, v)
        end
      end
    else
      origin = tabs[i]
    end
  end
  return origin
end

-- set map
M.set_map = function(map)
  for _, m in ipairs(map) do
    if m[4] == nil then
      m[4] = { noremap = true }
    end
    vim.keymap.set(m[1], m[2], m[3], m[4])
  end
end

-- copy file
M.copy_file = function(oldPath, newPath)
  local oldIcon, errorString = io.open(oldPath, "rb")
  assert(oldIcon ~= nil, errorString)
  local data = oldIcon:read "a"
  oldIcon:close()
  local newIcon = io.open(newPath, "wb")
  newIcon:write(data)
  newIcon:close()
end

-- get lldb path
M.get_lldb_path = function()
  if vim.g.lldb ~= nil then
    if vim.fn.executable(vim.g.lldb) == 1 then
      return vim.g.lldb
    end
  end
  return "codelldb"
end

return M
