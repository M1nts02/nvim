local set_map = require("core.utils").set_map

set_map {
  -- Move
  { { "i", "c" }, "<M-0>", "<Home>" },
  { { "i", "c" }, "<M-4>", "<End>" },
  { { "i", "c" }, "<M-l>", "<Right>" },
  { { "i", "c" }, "<M-j>", "<Down>" },
  { { "i", "c" }, "<M-h>", "<Left>" },
  { { "i", "c" }, "<M-k>", "<Up>" },
  -- Completion
  { { "i" }, "<C-l>", "<C-x><C-f>" },
  -- Indenting
  { { "v" }, "<", "<gv" },
  { { "v" }, ">", ">gv" },
  -- Change number
  { { "v" }, "<C-a>", "<C-a>gv" },
  { { "v" }, "<C-x>", "<C-x>gv" },

  -- LSP
  {
    { "n" },
    "<Space>la",
    function()
      vim.lsp.buf.rename()
    end,
    { desc = "Rename", noremap = true },
  },
  {
    { "n" },
    "<Space>lc",
    function()
      vim.lsp.buf.code_action()
    end,
    { desc = "Code Action", noremap = true },
  },
  {
    { "n" },
    "<Space>lg",
    function()
      vim.lsp.buf.outgoing_calls()
    end,
    { desc = "Outgoing Calls", noremap = true },
  },
  {
    { "n" },
    "K",
    function()
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        vim.cmd "Man"
        return
      end
      vim.lsp.buf.hover()
    end,
    { desc = "Hover", noremap = true },
  },
}
