return {
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