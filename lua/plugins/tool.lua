return {
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
}
