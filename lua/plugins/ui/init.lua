return {
  -- Dashboard
  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    main = "dashboard",
    opts = require "plugins.ui.dashboard",
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
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
  { "kevinhwang91/nvim-bqf", event = "QuickFixCmdPre" },

  -- Quick window
  {
    "folke/trouble.nvim",
    event = { "LspAttach" },
    cmd = { "TroubleToggle", "Trouble", "TroubleClose", "TroubleRefresh" },
    keys = {
      { "<Space>ld", "<CMD>Trouble lsp_definitions<CR>", desc = "Definition" },
      { "<Space>lr", "<CMD>Trouble lsp_references<CR>", desc = "References" },
      { "<Space>le", "<CMD>Trouble document_diagnostics<CR>", desc = "Diagnostics" },
      { "<Space>lE", "<CMD>Trouble workspace_diagnostics<CR>", desc = "Workspace Diagnostics" },
      { "gd", "<CMD>Trouble lsp_definitions<CR>", desc = "Definition" },
      {
        "<Space>fg",
        function()
          local arg = vim.fn.input "Grep: "
          vim.cmd("vimgrep /" .. arg .. "/gj **")
          vim.cmd "Trouble quickfix"
        end,
        desc = "Grep",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
