local utils = require "core.utils"
local path_join = utils.path_join

return {
  -- Template
  {
    "M1nts02/nvim-template",
    cmd = "Templ",
    opts = {
      templ_dir = path_join(vim.fn.stdpath "config", "template"),
      templ_register_file = path_join(vim.fn.stdpath "config", "template.json"),
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    enabled = not utils.is_windows,
    event = { "BufRead", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    init = function()
      -- Enable highlight
      vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = { "*.kdl", "*.md", "*.nu", "*.toml", "*.yaml" },
        command = "TSBufEnable highlight",
      })
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
    opts = {
      ensure_installed = { "c", "lua", "markdown", "org", "query", "vim", "vimdoc" },
      sync_install = false,
      auto_install = true,
      highlight = { enable = false, additional_vim_regex_highlighting = false },
    },
    dependencies = {
      { "LhKipp/nvim-nu", main = "nu", opts = { use_lsp_features = false } },
    },
  },

  -- Cursor jump
  {
    "ggandor/flit.nvim",
    event = { "BufRead", "BufNewFile" },
    main = "flit",
    keys = { "f", "F", "t", "T" },
    opts = {
      keys = { f = "f", F = "F", t = "t", T = "T" },
      labeled_modes = "nv",
    },
    dependencies = { "ggandor/leap.nvim" },
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

  -- Highlighting for csv
  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    ft = { "csv" },
  },

  -- Crates
  {
    "Saecki/crates.nvim",
    event = { "BufRead Cargo.toml", "LspAttach" },
    main = "crates",
    opts = {},
  },
}
