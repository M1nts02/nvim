local utils = require "core.utils"
local path_join = utils.path_join

return {
  -- Template
  {
    "M1nts02/nvim-template",
    cmd = { "Templ", "TemplAdd", "TemplDel" },
    opts = {
      templ_dir = path_join(vim.fn.stdpath "config", "template"),
      templ_register_file = path_join(vim.fn.stdpath "config", "template.json"),
    },
  },

  -- Cursor jump
  {
    "folke/flash.nvim",
    event = { "BufRead", "BufNewFile" },
    keys = {
      {
        "<C-f>",
        mode = { "n", "x", "o", "v" },
        function()
          require("flash").jump()
        end,
        desc = "Jump",
      },
    },
    opts = {
      modes = {
        search = { enabled = false },
        char = { enabled = false },
      },
    },
  },

  -- TODO
  {
    "folke/todo-comments.nvim",
    cmd = { "TodoLocList", "TodoQuickFix", "TodoTelescope", "TodoTrouble" },
    keys = { { "<Space>ft", "<CMD>TodoTelescope<CR>", desc = "Todo list" } },
    main = "todo-comments",
    opts = {},
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Indent scope
  {
    "echasnovski/mini.indentscope",
    version = "*",
    event = "LspAttach",
    main = "mini.indentscope",
    opts = {},
  },

  -- Comment
  {
    "numToStr/Comment.nvim",
    version = "*",
    keys = { "gc", "gb" },
    main = "Comment",
    opts = {},
  },

  -- Undo tree
  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle", "UndotreeFocus" },
  },
}
