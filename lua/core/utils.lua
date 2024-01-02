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

M.mason_path = function(m)
  local data = vim.fn.stdpath "data"
  return M.path_join(data, "mason", "bin", m)
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

-- set buf map
M.set_buf_map = function(map)
  for _, m in ipairs(map) do
    if m[5] == nil then
      m[5] = { noremap = true }
    end

    vim.api.nvim_create_autocmd({ "BufNewFile", "BufFilePre", "BufRead" }, {
      pattern = m[1],
      callback = function()
        if type(m[2]) == "table" then
          for _, mode in ipairs(m[2]) do
            vim.api.nvim_buf_set_keymap(0, mode, m[3], m[4], m[5])
          end
        else
          vim.api.nvim_buf_set_keymap(0, m[2], m[3], m[4], m[5])
        end
      end,
    })
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

-- create float window
M.create_float_win = function(opt)
  -- get window size
  local ui = vim.api.nvim_list_uis()[1]
  -- options
  local win = vim.tbl_extend("force", {
    width = math.ceil(ui.width / 2),
    height = math.ceil(ui.height / 2),
    buflisted = false,
    title = "",
    border = "none",
    lines = { "" },
    pos = { pos = "cc" },
  }, opt or {})

  -- set relative size
  win.width = win.width >= 1 and win.width or math.ceil(win.width * ui.width)
  win.height = win.height >= 1 and win.height or math.ceil(win.height * ui.height)

  -- let float size is larger than lines
  if win.lines then
    for _, v in ipairs(win.lines) do
      win.width = math.max(win.width, vim.fn.strchars(v))
    end
    win.height = math.max(win.height, #win.lines)
  end

  local buf = vim.api.nvim_create_buf(win.buflisted, true)

  -- get pos
  local x, y = 0, 0
  if win.pos.pos then
    if win.pos.pos:sub(1, 1) == "c" then
      y = math.ceil((ui.height - win.height) / 2)
    elseif win.pos.pos:sub(1, 1) == "t" then
      y = 0
    elseif win.pos.pos:sub(1, 1) == "b" then
      y = ui.height - win.height
    end

    if win.pos.pos:sub(2, 2) == "c" then
      x = math.ceil((ui.width - win.width) / 2)
    elseif win.pos.pos:sub(2, 2) == "l" then
      x = 0
    elseif win.pos.pos:sub(2, 2) == "r" then
      x = ui.width - win.width
    end
  else
    x, y = win.pos.x, win.pos.y
  end

  local opts = {
    relative = "editor",
    width = win.width,
    height = win.height,
    col = x,
    row = y,
    style = "minimal",
    title = win.title,
    title_pos = "center",
    border = win.border,
  }

  -- open float windows
  vim.api.nvim_open_win(buf, true, opts)
  -- add lines
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, win.lines)

  -- return buffer id
  return buf
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
