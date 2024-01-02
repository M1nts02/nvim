return {

  -- Plugins manager
  { "folke/lazy.nvim", version = "*" },

  -- Theme
  { "M1nts02/akane.nvim", lazy = false },

  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    main = "dashboard",
    opts = require "plugins.starter.dashboard",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },
}
