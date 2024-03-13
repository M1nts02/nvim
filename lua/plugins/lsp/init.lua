return {
  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "plugins.lsp.lspconfig"
    end,
  },

  -- Winbar
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

  -- Document symbols
  {
    "stevearc/aerial.nvim",
    keys = { { "<Space>ls", "<CMD>AerialToggle<CR>", desc = "Symbol" } },
    opts = {
      backends = { "markdown", "lsp", "man" },
      layout = {
        max_width = 0.3,
        min_width = 0.2,
        default_direction = "right",
        placement = "edge",
      },
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
}
