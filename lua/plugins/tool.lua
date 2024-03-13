return {
  -- Search
  {
    "ibhagwan/fzf-lua",
    cmd = { "FzfLua" },
    keys = {
      { "<Space>f<CR>", "<CMD>FzfLua builtin<CR>", desc = "Telescope" },
      { "<Space>ff", "<CMD>FzfLua files<CR>", desc = "File" },
      { "<Space>fb", "<CMD>FzfLua buffers<CR>", desc = "Buffer" },
      { "<Space>fh", "<CMD>FzfLua help_tags<CR>", desc = "Help" },
      { "<Space>fo", "<CMD>FzfLua oldfiles<CR>", desc = "Oldfile" },
      { "<Space>fm", "<CMD>FzfLua marks<CR>", desc = "Marks" },
      { "<Space>/", "<CMD>FzfLua lines<CR>", desc = "Line" },
      { "<Space>lS", "<CMD>FzfLua lsp_workspace_symbols<CR>", desc = "Symbol Workspace" },
      { "z=", "<CMD>FzfLua spell_suggest<CR>", desc = "spell suggest" },
    },
    opts = {
      winopts = {
        height = 0.7,
        width = 0.8,
        preview = {
          horizontal = "right:50%",
          scrollbar = false,
        },
      },
      fzf_colors = {
        ["fg"] = { "fg", "CursorLine" },
        ["bg"] = { "bg", "Normal" },
        ["hl"] = { "fg", "Comment" },
        ["fg+"] = { "fg", "Normal" },
        ["bg+"] = { "bg", "CursorLine" },
        ["hl+"] = { "fg", "Statement" },
        ["info"] = { "fg", "PreProc" },
        ["prompt"] = { "fg", "Conditional" },
        ["pointer"] = { "fg", "Exception" },
        ["marker"] = { "fg", "Keyword" },
        ["spinner"] = { "fg", "Label" },
        ["header"] = { "fg", "Comment" },
        ["gutter"] = { "bg", "Normal" },
      },
      previewers = {
        builtin = {
          treesitter = { enable = false },
          extensions = {
            ["png"] = { "viu", "-b" },
            ["svg"] = { "chafa", "{file}" },
            ["jpg"] = { "viu", "-b" },
          },
        },
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "junegunn/fzf",
        enabled = vim.fn.executable "fzf" ~= 1,
        build = "./install --bin",
      },
    },
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
