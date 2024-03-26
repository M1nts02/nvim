return {
  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    main = "dashboard",
    opts = require "plugins.starter.dashboard",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      { -- Toggle theme
        "M1nts02/toggle-theme.nvim",
        keys = { { "<Space>tt", "<CMD>ToggleTheme<CR>", desc = "Theme" } },
        opts = {
          following_system = vim.g.following_system,
          start_only = vim.g.start_only,
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
