return {
  cmdline = {
    enabled = true,
    view = "cmdline_popup",
    opts = {},
  },
  messages = { enabled = false },
  popupmenu = {
    enabled = true,
    backend = "cmp",
    relative = "editor",
    position = { row = 8, col = "50%" },
    size = { width = "71%", height = 10 },
    border = { style = "rounded", padding = { 0, 1 } },
    win_options = {
      winhighlight = {
        Normal = "Normal",
        FloatBorder = "DiagnosticInfo",
      },
    },
  },
  notify = { enabled = false },
  lsp = {
    progress = { enabled = false },
    hover = { enabled = false },
    signature = { enabled = false },
    message = { enabled = false },
  },
  health = { checker = false },
  smart_move = { enabled = false },
  routes = { {
    view = "VirtualText",
    filter = { event = "msg_showmode" },
  } },
  views = {
    cmdline_popup = {
      position = { row = 5, col = "50%" },
      size = { width = "70%", height = "auto" },
    },
  },
}
