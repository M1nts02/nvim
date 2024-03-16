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
      require "plugins.completion.commands"
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

  -- Command line
  {
    "hrsh7th/cmp-cmdline",
    keys = { ":", "/", "?" },
    opts = function()
      local cmp = require "cmp"
      return {
        {
          type = "/",
          completion = { keyword_length = 1 },
          mapping = cmp.mapping.preset.cmdline(),
          sources = { { name = "buffer" } },
        },
        {
          type = ":",
          completion = { keyword_length = 1 },
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources(
            { { name = "path" } },
            { { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
          ),
        },
        {
          type = "@",
          completion = { keyword_length = 1 },
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources {
            { name = "path" },
            { { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } },
          },
        },
      }
    end,
    config = function(_, opts)
      local cmp = require "cmp"
      vim.tbl_map(function(val)
        cmp.setup.cmdline(val.type, val)
      end, opts)
    end,
    dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-buffer" },
  },
}
