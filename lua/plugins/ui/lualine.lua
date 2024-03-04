-- get lsp client
local get_lsp_client = function()
  local msg = ""
  local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
  local clients = vim.lsp.get_active_clients()
  if next(clients) == nil then
    return msg
  end

  for _, client in ipairs(clients) do
    local filetypes = client.config.filetypes
    if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
      return client.name
    end
  end
  return msg
end

-- get buffer name and id
local get_buffer_name_id = function()
  local name = vim.fn.expand "%:t"
  if name == "" then
    return ""
  end
  local id = vim.api.nvim_win_get_buf(0)
  return name .. " [" .. id .. "]"
end

-- get tab id
local get_tab_id = function()
  local id = vim.fn.tabpagenr()
  local count = vim.fn.tabpagenr "$"
  return "TAB." .. id .. "/" .. count
end

return {
  options = {
    icons_enabled = true,
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = {
      function()
        return get_buffer_name_id()
      end,
      "location",
      "progress",
    },
    lualine_c = { "diff" },
    lualine_x = {
      "diagnostics",
      { "lsp_progress", display_components = { { "title", "percentage", "message" } } },
      function()
        return get_lsp_client()
      end,
    },
    lualine_y = {
      {
        function()
          return get_tab_id()
        end,
      },
      "encoding",
      "fileformat",
      "branch",
    },
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
}
