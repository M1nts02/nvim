return {
  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    main = "dashboard",
    opts = require "plugins.starter.dashboard",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    event = { "VeryLazy" },
    main = "lualine",
    opts = require "plugins.starter.lualine",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "WhoIsSethDaniel/lualine-lsp-progress.nvim",
      { -- Toggle theme
        "M1nts02/toggle-theme.nvim",
        opts = {
          following_system = vim.g.following_system,
          light_mode = function()
            vim.cmd "colorscheme akane-light"
          end,
          dark_mode = function()
            vim.cmd "colorscheme akane-dark"
          end,
        },
        dependencies = { { "M1nts02/akane.nvim", opts = { transparent = vim.g.transparent } } },
      },
    },
  },
}
