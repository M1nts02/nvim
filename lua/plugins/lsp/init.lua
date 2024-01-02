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
    keys = require "plugins.lsp.ufo",
    main = "ufo",
    opts = {},
    dependencies = "kevinhwang91/promise-async",
  },
}
