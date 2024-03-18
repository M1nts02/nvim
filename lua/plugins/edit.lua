local utils = require "core.utils"
local path_join = utils.path_join

return {
  -- ron
  {
    "ron-rs/ron.vim",
    ft = { "ron" },
  },

  -- Search highlighting
  {
    "nvimdev/hlsearch.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = {},
  },

  -- csv
  {
    "cameron-wags/rainbow_csv.nvim",
    config = true,
    ft = {
      "csv",
      "tsv",
      "csv_semicolon",
      "csv_whitespace",
      "csv_pipe",
      "rfc_csv",
      "rfc_semicolon",
    },
    cmd = {
      "RainbowDelim",
      "RainbowDelimSimple",
      "RainbowDelimQuoted",
      "RainbowMultiDelim",
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo", "TSUpdate" },
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
          require("flash").jump { search = { forward = true, wrap = false, multi_window = false } }
        end,
        desc = "Jump forward",
      },
      {
        "<C-b>",
        mode = { "n", "x", "o", "v" },
        function()
          require("flash").jump { search = { forward = false, wrap = false, multi_window = false } }
        end,
        desc = "Jump backward",
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
    cmd = { "TodoLocList", "TodoQuickFix", "TodoTrouble" },
    main = "todo-comments",
    opts = {},
    dependencies = { "nvim-lua/plenary.nvim", "kevinhwang91/nvim-bqf" },
  },

  -- Indent scope
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = {
      chunk = {
        enable = true,
        notify = false,
        use_treesitter = false,
        style = { { link = "LineNr" }, { link = "ErrorMsg" } },
      },
      indent = { enable = false },
      line_num = { enable = false },
      blank = { enable = false },
    },
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
