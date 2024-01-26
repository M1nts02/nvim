return {

  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "plugins.lsp.lspconfig"
      require "plugins.lsp.command"
    end,
    dependencies = {
      {
        "folke/neodev.nvim",
        opts = {},
      },
    },
  },

  -- Winbar like vscode
  --{ "Bekaboo/dropbar.nvim", version = "*" }, -- requirement neovim-0.10+
  {
    "utilyre/barbecue.nvim",
    event = "LspAttach",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
    opts = { show_dirname = false },
  },

  -- LSP-based code folding
  {
    "kevinhwang91/nvim-ufo",
    event = "LspAttach",
    main = "ufo",
    keys = {
      { "zR", '<CMD>lua require("ufo").openAllFolds()<CR>', desc = "Open all folds" },
      { "zM", '<CMD>lua require("ufo").closeAllFolds()<CR>', desc = "Close all folds" },
      { "zr", '<CMD>lua require("ufo").openFoldsExceptKinds()<CR>', desc = "Open fold" },
      { "zm", '<CMD>lua require("ufo").closeFoldsWith()<CR>', desc = "Close fold" },
    },
    opts = {},
    dependencies = "kevinhwang91/promise-async",
  },

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
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
  },
}
