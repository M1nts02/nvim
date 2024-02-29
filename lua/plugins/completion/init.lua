return {

  -- Completion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    cmd = { "CmpToggle", "CmpRgToggle" },
    init = function()
      vim.g.cmp_toggle = true
    end,
    config = function()
      require "plugins.completion.cmp"
      require "plugins.completion.command"
    end,
    dependencies = {
      "hrsh7th/cmp-path", -- Support path
      "hrsh7th/cmp-nvim-lsp", -- Support LSP
      "onsails/lspkind-nvim", -- Add icons
      "saadparwaiz1/cmp_luasnip", -- Support luasnip
      "lukas-reineke/cmp-rg", -- Ripgrep
      { -- Snippet
        "L3MON4D3/LuaSnip",
        event = { "InsertEnter", "LspAttach" },
        build = (not vim.g.is_windows) and "make install_jsregexp" or nil,
        config = function()
          require("luasnip.loaders.from_vscode").load()
        end,
        dependencies = { "rafamadriz/friendly-snippets" },
      },
    },
  },
}
