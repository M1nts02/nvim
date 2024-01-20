local M = {}

-- connect path
M.path_join = function(...)
  local sep = vim.g.is_windows and "\\" or "/"
  return table.concat({ ... }, sep)
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
