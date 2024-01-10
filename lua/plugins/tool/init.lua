local utils = require "core.utils"

return {

  -- Markdown preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  -- Code format
  {
    "stevearc/conform.nvim",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require "plugins.tool.conform"
    end,
  },

  -- Buffer manager
  {
    "j-morano/buffer_manager.nvim",
    keys = {
      {
        "<Space>b",
        function()
          require("buffer_manager.ui").toggle_quick_menu()
        end,
        desc = "Buffer manager",
      },
    },
    main = "buffer_manager",
    opts = {},
  },

  -- Task system
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerBuild",
      "OverseerClearCache",
      "OverseerClose",
      "OverseerDeleteBundle",
      "OverseerInfo",
      "OverseerLoadBundle",
      "OverseerOpen",
      "OverseerQuickAction",
      "OverseerRun",
      "OverseerRunCmd",
      "OverseerSaveBundle",
      "OverseerTaskAction",
      "OverseerToggle",
    },
    main = "overseer",
    opts = {},
  },

  -- Colors highlighting
  {
    "uga-rosa/ccc.nvim",
    cmd = {
      "CccConvert",
      "CccHighlighterDisable",
      "CccHighlighterEnablee",
      "CccHighlighterToggle",
      "CccPick",
    },
    keys = {
      { "<Space>pc", "<CMD>CccHighlighterToggle<CR>", desc = "Colors Highlighting" },
      { "<Space>pp", "<CMD>CccPick<CR>", desc = "Colors Pick" },
    },
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    cmd = { "Neogit" },
    keys = { { "<Space>gn", "<CMD>Neogit<CR>", desc = "Neogit" } },
    main = "neogit",
    opts = { integrations = { diffview = true } },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
    },
  },

  -- Gitsigns
  {
    "lewis6991/gitsigns.nvim",
    cmd = { "Gitsigns" },
    keys = {
      { "<Space>gg", "<CMD>Gitsigns<CR>", desc = "Gitsigns" },
      { "<Space>gd", "<CMD>Gitsigns diffthis<CR>", desc = "Diff" },
      { "<Space>g<Cr>", "<CMD>Gitsigns refresh<CR>", desc = "Gitsigns refresh" },
    },
    main = "gitsigns",
    opts = { signcolumn = false },
  },

  -- File browser
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    keys = { { "<Space>e", "<CMD>NvimTreeToggle<CR>", desc = "Nvim-tree" } },
    opts = require "plugins.tool.nvim-tree",
    dependencies = { "rcarriga/nvim-notify" },
  },

  -- Terminal
  {
    "akinsho/toggleterm.nvim",
    keys = { [[<C-\>]] },
    main = "toggleterm",
    opts = {
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      autochdir = false,
      start_in_insert = true,
      direction = "float",
      close_on_exit = true,
      auto_scroll = true,
      float_opts = { border = "curved" },
      winbar = { enabled = false },
    },
  },

  -- Workspace manager
  {
    "natecraddock/workspaces.nvim",
    cmd = {
      "WorkspacesAdd",
      "WorkspacesAddDir",
      "WorkspacesList",
      "WorkspacesListDirs",
      "WorkspacesOpen",
      "WorkspacesRemove",
      "WorkspacesRemoveDir",
      "WorkspacesRename",
      "WorkspacesSyncDirs",
    },
    keys = { { "<Space>fw", "<CMD>WorkspacesOpen<CR>", desc = "Workspace" } },
    main = "workspaces",
    opts = {
      path = require("core.utils").path_join(vim.fn.stdpath "data", "workspaces"),
      cd_type = "global",
      sort = true,
      mru_sort = true,
      notify_info = true,
      hooks = {},
    },
  },

  -- Install tool
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonLog",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonUpdate",
    },
    main = "mason",
    opts = require "plugins.tool.mason",
  },

  -- Search
  {
    "nvim-telescope/telescope.nvim",
    cmd = { "Telescope" },
    keys = require("plugins.tool.telescope").keys,
    main = "telescope",
    opts = require("plugins.tool.telescope").options,
    dependencies = {
      "nvim-lua/plenary.nvim",
      { -- Telescope.nvim Support fzf
        "nvim-telescope/telescope-fzf-native.nvim",
        enabled = not utils.is_windows,
        build = "make",
        opts = {
          extensions = {
            fzf = {
              fuzzy = true,
              override_generic_sorter = true,
              override_file_sorter = true,
              case_mode = "smart_case",
            },
          },
        },
        config = function()
          require("telescope").load_extension "fzf"
        end,
      },
      { -- Session
        "rmagatti/session-lens",
        keys = {         { "<Space>fs", "<CMD>Telescope session-lens search_session<CR>", desc = "Sessions" },
        },
        config = function()
          require("telescope").load_extension "session-lens"
        end,
        dependencies = {
          {
            "rmagatti/auto-session",
            main = "auto-session",
            opts = {},
          },
        },
      },
    },
    config = function(_, opts)
      require("telescope").setup(opts)
    end,
  },

  -- Which key
  {
    "folke/which-key.nvim",
    keys = require("plugins.tool.which-key").keys,
    config = require("plugins.tool.which-key").config,
    dependencies = {
      { -- Hydra
        "anuvyklack/hydra.nvim",
        config = function()
          require "plugins.tool.hydra"
        end,
      },
    },
  },
}
