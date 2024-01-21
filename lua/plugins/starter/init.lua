return {

  -- Plugins manager
  { "folke/lazy.nvim", version = "*" },

  -- Theme
  { "M1nts02/akane.nvim", lazy = false },

  -- Toggle theme
  {
    "M1nts02/toggle-theme.nvim",
    event = "UIEnter",
    opts = {
      light_mode = function()
        vim.cmd "colorscheme akane-light"
      end,
      dark_mode = function()
        vim.cmd "colorscheme akane-dark"
      end,
    },
  },

  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    main = "dashboard",
    opts = require "plugins.starter.dashboard",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
