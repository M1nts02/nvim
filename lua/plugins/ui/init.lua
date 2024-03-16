return {
  -- Float UI
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    main = "noice",
    opts = require "plugins.ui.noice",
    dependencies = {
      "MunifTanjim/nui.nvim",
      {
        "rcarriga/nvim-notify",
        opts = {
          max_width = "40",
          reader = "compact",
          animate = false,
          timeout = 2000,
          fps = 5,
          level = 1,
          stages = "static",
        },
      },
    },
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = { "VeryLazy" },
    main = "lualine",
    opts = require "plugins.ui.lualine",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "WhoIsSethDaniel/lualine-lsp-progress.nvim",
    },
  },

  -- Status column
  {
    "luukvbaal/statuscol.nvim",
    event = { "BufRead", "BufNewFile" },
    main = "statuscol",
    opts = {},
  },

  -- UI for vim.ui.select and vim.ui.input
  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
    main = "dressing",
    opts = { input = { enabled = false } },
  },

  -- Previewe for quick window
  {
    "kevinhwang91/nvim-bqf",
    event = "QuickFixCmdPre",
  },
}
